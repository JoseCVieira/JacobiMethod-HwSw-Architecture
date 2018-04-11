/*
 * my_axis_fifo.c
 *
 *  Created on: 20/03/2018
 *      Author: hcn
 */


// Adapted from XLlFifo_polling_example.c

/***************************** Include Files *********************************/
#include "xparameters.h"
#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"
#include "xstatus.h"
#include <stdio.h>

/************************** Function Prototypes ******************************/
int my_axis_fifo_init();
unsigned my_send_to_fifo(void *BufPtr, unsigned nWords);
unsigned my_receive_from_fifo(void *BufPtr, unsigned nWords);

/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */
XLlFifo FifoInstance;

int my_axis_fifo_init()
{
	XLlFifo_Config *Config;
	XLlFifo *InstancePtr;
	int Status;

	InstancePtr = &FifoInstance;
	Status = XST_SUCCESS;

	/* Initialize the Device Configuration Interface driver */
	Config = XLlFfio_LookupConfig(XPAR_AXI_FIFO_0_DEVICE_ID);
	if (!Config) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_FIFO_0_DEVICE_ID);
		return XST_FAILURE;
	}

	Status = XLlFifo_CfgInitialize(InstancePtr, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed\n\r");
		return Status;
	}

	/* Check for the Reset value */
	Status = XLlFifo_Status(InstancePtr);
	XLlFifo_IntClear(InstancePtr,0xffffffff);
	Status = XLlFifo_Status(InstancePtr);
	if(Status != 0x0) {
		xil_printf("\n ERROR : Reset value of ISR0 : 0x%x\t Expected : 0x0\n\r",
			       XLlFifo_Status(InstancePtr));
		return XST_FAILURE;
	}

	return Status;
}

// A frame is transmittted by using the following sequence:
// 1) call XLlFifo_Write() one or more times to write all of the bytes in the next frame.
// 2) call XLlFifo_TxSetLen() to begin the transmission of frame just written.

unsigned my_send_to_fifo(void *BufPtr, unsigned nWords)
{
  unsigned available_words=0, words_to_send=0;
  unsigned bytes_to_send=0;

  available_words = XLlFifo_iTxVacancy(&FifoInstance);

// If you want to wait for available space in the FIFO uncomment the following loop
//  while (nWords > available_words) {
//	  available_words = XLlFifo_iTxVacancy(&FifoInstance);
//  }

  words_to_send = (nWords > available_words) ? available_words : nWords;
  bytes_to_send = words_to_send*4;
  XLlFifo_Write(&FifoInstance, BufPtr, bytes_to_send);
  XLlFifo_TxSetLen(&FifoInstance, bytes_to_send);

  /* Check for Transmission completion */
  while( !(XLlFifo_IsTxDone(&FifoInstance)) );

  return words_to_send;
}

// A frame is received by using the following sequence:
// 1) call XLlFifo_RxOccupancy() to check the occupancy count
// 2) call XLlFifo_RxGetLen() to get the length of the next incoming frame
// 3) call XLlFifo_Read() one or more times to read the number of bytes reported by XLlFifo_RxGetLen().

unsigned my_receive_from_fifo(void *BufPtr, unsigned nWords)
{
  unsigned bytes_to_read=0, frame_len=0, n=0;

  // wait for something to read
  while (! (n=XLlFifo_RxOccupancy(&FifoInstance)) );
  // printf("RxOccup=%d nWords=%d\n", n, nWords);
  frame_len = (unsigned)XLlFifo_RxGetLen(&FifoInstance);
  // printf("RxOccup=%d fl=%d\n\n", n, frame_len);
  bytes_to_read = ((nWords*4) > frame_len) ? frame_len : (nWords*4);
  XLlFifo_Read(&FifoInstance, BufPtr, bytes_to_read);

  /* Check for Reception completion */
  while( !(XLlFifo_IsRxDone(&FifoInstance)) );

  return (bytes_to_read/4);
}
