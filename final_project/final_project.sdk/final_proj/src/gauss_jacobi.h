/*
* Co-Projecto Hw/Sw
*
* Group 11
* Jo�o Ramiro - 81138
* Jos� Vieira - 90900
*
* gauss_jacobi.h
*/

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "xtime_l.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xil_mmu.h"

/* Define sizeof */
#define MATSIZE     100
#define FLOAT_SIZE  4
#define MATRIX_SIZE FLOAT_SIZE*MATSIZE*MATSIZE
#define VECTOR_SIZE FLOAT_SIZE*MATSIZE

/* Semaphore flags */
#define PROC0_START      11
#define PROC0_INV_FINISH 22
#define PROC0_RESTARTED  66
#define PROC0_FINISH     33
#define PROC1_START      44
#define PROC1_INV_FINISH 55
#define PROC1_RESTARTED  66
#define PROC1_COMPLETED  77

/* Define max error of gauss method */
#define MAX_ERROR 0.0000001
#define MAX_IT 100

/* Define pointers to each memory */
volatile float *memA, *memB, *memRes, *memXi, *memA_D_Inv, *memX, *norm_value;

/* Define a macro */
#define A(I,J) (memA[I*MATSIZE+J])

/* Define base address of each memory */
#define A_START_ADD   0x15000000
#define B_START_ADD   (A_START_ADD + MATRIX_SIZE)
#define X_START_ADD   (B_START_ADD + VECTOR_SIZE)
#define A_D_INV_ADD   (X_START_ADD + VECTOR_SIZE)
#define RES_START_ADD (A_D_INV_ADD + VECTOR_SIZE)
#define NORM_ADD 	  (RES_START_ADD + VECTOR_SIZE)

#define DMA_DEV_ID_0 XPAR_AXIDMA_0_DEVICE_ID

// Device instance definitions
XAxiDma AxiDma_0;

int XAxiDma_Simple_MatProd();
int init_XAxiDma_SimplePollMode(u16 DeviceId, XAxiDma *AxiDma);
void show_results(int n_it, unsigned long long int clock_cycles, float u_sec);