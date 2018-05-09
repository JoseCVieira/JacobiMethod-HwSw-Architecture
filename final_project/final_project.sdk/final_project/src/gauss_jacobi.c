/*
* Co-Projecto Hw/Sw
*
* Group 11
* Jo�o Ramiro - 81138
* Jos� Vieira - 90900
*
* gauss_jacobi.c
*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "xtime_l.h"
#include "xaxidma.h"
#include "xparameters.h"
//#include "xil_mmu.h"
#include "xil_cache.h"
//#include "xil_cache_l.h"

/* Define sizeof */
#define MATSIZE     8
#define INT_SIZE    4
#define MATRIX_SIZE INT_SIZE*MATSIZE*MATSIZE
#define VECTOR_SIZE INT_SIZE*MATSIZE

/* Define max error of gauss method */
#define MAX_ERROR 0.0000001

/* Define pointers to each memory */
volatile int *memA, *memB, *memRes, *memXi;
volatile float *memA_D_Inv, *memX;

/* Define a macro */
#define A(I,J)     (memA[I*MATSIZE+J])

/* Define base address of each memory */
#define A_START_ADD   0x10000000
#define B_START_ADD   (A_START_ADD + MATRIX_SIZE)
#define X_START_ADD   (B_START_ADD + VECTOR_SIZE)
#define A_D_INV_ADD   (X_START_ADD + VECTOR_SIZE)
#define RES_START_ADD (A_D_INV_ADD + VECTOR_SIZE)

#define DMA_DEV_ID XPAR_AXIDMA_0_DEVICE_ID

/* Function prototypes */
void show_results(int n_it, unsigned long long int clock_cycles, float u_sec);
int init_XAxiDma_SimplePollMode(u16 DeviceId);
int XAxiDma_Simple_MatProd(u16 DeviceId);

// Device instance definitions
XAxiDma AxiDma;

int main() {
	int status;

    // Xil_DCacheDisable();
	Xil_DCacheInvalidate();

	/* Init DMA in poll mode for simple transfer */
	status = init_XAxiDma_SimplePollMode(DMA_DEV_ID);
	if (status != XST_SUCCESS) {
		printf("init_XAxiDma_SimplePollMode: Failed\r\n");
		return XST_FAILURE;
	}

	status = XAxiDma_Simple_MatProd(DMA_DEV_ID);
	if (status != XST_SUCCESS) {
		printf("XAxiDma_Simple_MatProd: Failed\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

int XAxiDma_Simple_MatProd(u16 DeviceId){
	XTime tStart, tEnd;
    int i, status;

    /* Points each pointer to the respective base address */
    memA       = (int *)(A_START_ADD);
    memB       = (int *)(B_START_ADD);
    memRes     = (int *)(RES_START_ADD);
    memXi      = (int *)(X_START_ADD);
    memX       = (float *)(X_START_ADD);
    memA_D_Inv = (float *)(A_D_INV_ADD);

    printf("\nSolution - X=\n");
        for(i = 0; i < MATSIZE; i++)
            printf("%d\n", memXi[i]);

	/* Start measuring time */
    XTime_GetTime(&tStart);

    for (i = 0; i < MATSIZE; i++){
        /* Get the inverse of A(i,i) and
         * apply the "if(i!=j)" in gauss method
         * by putting the diagonal to 0
         */
    	memA_D_Inv[i] = 1.0f/A(i,i);
        A(i,i) = 0;
    }

    Xil_DCacheFlushRange((INTPTR)memA, (unsigned)(MATRIX_SIZE));

	// send memXi
    status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR)memXi, VECTOR_SIZE, XAXIDMA_DMA_TO_DEVICE);

	if (status != XST_SUCCESS)
		return XST_FAILURE;

	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) { /* Wait for Tx*/ }

	// receive memRes
	status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR)memRes, VECTOR_SIZE, XAXIDMA_DEVICE_TO_DMA);

	if (status != XST_SUCCESS)
		return XST_FAILURE;

	// send full matrix A
	status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR)memA, MATRIX_SIZE, XAXIDMA_DMA_TO_DEVICE);

	if (status != XST_SUCCESS)
		return XST_FAILURE;

	while (XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE)) { /* Wait Tx */ }

	while (XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA)) { /* Wait Rx*/ }

	// Invalidate Cache Range to force reading matrix C from external memory
	Xil_DCacheInvalidateRange((INTPTR)memRes, VECTOR_SIZE);

    /* Gauss jacobi - only one iteration thus do not have a stop condition */
    for (i = 0; i < MATSIZE; i++)
    	memX[i] = (float)memA_D_Inv[i]*(memB[i]-memRes[i]);

    /* End measuring time */
    XTime_GetTime(&tEnd);

    /* Show results */
    show_results(1, 2*(tEnd-tStart), 1.0*(tEnd-tStart)/(COUNTS_PER_SECOND/1000000));

    return XST_SUCCESS;
}

/* Function prototypes */
void show_results(int n_it, unsigned long long int clock_cycles, float u_sec);
int init_XAxiDma_SimplePollMode(u16 DeviceId);
int XAxiDma_Simple_MatProd(u16 DeviceId);

/* Function prototypes */
int init_XAxiDma_SimplePollMode(u16 DeviceId);
void show_results(int n_it, unsigned long long int clock_cycles, float u_sec);

/* DMA functions */
int init_XAxiDma_SimplePollMode(u16 DeviceId) {
	XAxiDma_Config *CfgPtr;
	int Status;

	/* Initialize the XAxiDma device.	 */
	CfgPtr = XAxiDma_LookupConfig(DeviceId);
	if (!CfgPtr) {
		printf("No config found for %d\r\n", DeviceId);
		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
	if (Status != XST_SUCCESS) {
		printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma)){
		printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	/* Disable interrupts, we use polling mode	 */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	return XST_SUCCESS;
}

/* Show results function */
void show_results(int n_it, unsigned long long int clock_cycles, float u_sec) {
    float aux;
    int i, j;

    printf("-- Gauss Jacobi => [A]*[X]=[B], A[n*n], X[n*1], B[n*1]\n");

    printf("\nCoefficient matrix - A=\n");
    for(i = 0; i < MATSIZE; i++) {
        for(j = 0; j < MATSIZE; j++)
            printf("%3d ", A(i,j));
        printf("\n");
    }

    printf("\nMultiplication result - B=\n");
    for(i = 0; i < MATSIZE; i++)
        printf("%3d\n", memB[i]);

    printf("\nMultiplication result(HW) - Res=\n");
        for(i = 0; i < MATSIZE; i++)
            printf("%d\n", memRes[i]);

    printf("\nSolution - X=\n");
    for(i = 0; i < MATSIZE; i++)
        printf("%f\n", memX[i]);

    printf("\nNumber iterations - M=\n%d\n", n_it);

    printf("\nError - |B-(A*X)|=\n");

    for(i = 0; i < MATSIZE; i++){
        aux = 0;
        for(j = 0; j < MATSIZE; j++)
            aux += A(i,j)*memX[j];
        printf("%f\n", fabs(memB[i]-aux));
    }

    printf("\nclock cycles=\n%llu\n", clock_cycles);
    printf("\ntime(us)=\n%.2f\n\n", u_sec);
}
