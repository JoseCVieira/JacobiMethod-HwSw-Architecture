/*
* Co-Projecto Hw/Sw
*
* Group 11
* João Ramiro - 81138
* José Vieira - 90900
*
* auxiliar_functions1.c
*/

#include "gauss_jacobi1.h"

int init_XAxiDma_SimplePollMode(u16 DeviceId, XAxiDma *AxiDma) {
	XAxiDma_Config *CfgPtr;

	/* Initialize the XAxiDma device. */
	if(!(CfgPtr = XAxiDma_LookupConfig(DeviceId))) return XST_FAILURE;
	if (XAxiDma_CfgInitialize(AxiDma, CfgPtr) != XST_SUCCESS) return XST_FAILURE;
	if(XAxiDma_HasSg(AxiDma)) return XST_FAILURE;

	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	return XST_SUCCESS;
}
