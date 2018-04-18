/*****************************************************************************
 * File: mem_init.c
 *
 * Generates a binary file to initialize two matrices A and B
 *   Matrix A has size N1xN2
 *   Matriz B has size N2xN3
 *    If only one size is given N3=N2=N1
 *****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_VAL ((double)0x7FFFFFFF)
#define HALF_VAL ((int)0x3FFFFFFF)
#define RND_INT (half_val-(int) (max_val*rand()/(RAND_MAX+1.0)));

#define MEMA(I,J) (memA[(I)*N2+(J)])
#define MEMB(I,J) (memB[(I)*N3+(J)])
#define MEMC(I,J) (memC[(I)*N3+(J)])

int main(int argc, char *argv[])
{
  int N1, N2, N3, *memA, *memB, *memC;
  int i=0, j=0, k=0;
  int half_val = HALF_VAL ;
  double max_val = MAX_VAL ;
  FILE *fp;

  /* Forcing lower than maximum values */
  half_val = 0x3F;
  max_val = (double)(0x7F);

  if (argc == 1) {
    printf("Usage: %s N1 [N2] [N3]\n", argv[0]);
    exit(0);
  }
  if (argc > 1) {
    N1 = atoi(argv[1]) ;
    N2 = N1; N3 = N1;
  }
  if (argc > 2) {
    N2 = atoi(argv[2]) ;
  }
  if (argc > 3) {
    N3 = atoi(argv[3]) ;
  }
  printf("Initializing matrix A of size %dx%d and matrix B of size %dx%d\n", N1, N2, N2, N3);

  memA = calloc(N1*N2, sizeof (int)) ;
  memB = calloc(N2*N3, sizeof (int)) ;
  memC = calloc(N1*N3, sizeof (int)) ;

  srand(time(NULL));
  for (i = 0; i < N1; ++i) {
    for (j = 0; j < N2; ++j) {
      MEMA(i,j) = RND_INT;
    }
  }
  for (i = 0; i < N2; ++i) {
    for (j = 0; j < N3; ++j) {
      MEMB(i,j) = RND_INT;
    }
  }

  for (i = 0; i < N1; ++i) {
    for (j = 0; j < N3; ++j) {
      MEMC(i,j) = 0;
      for (k = 0; k < N2; k++) {
	MEMC(i,j) += MEMA(i,k) * MEMB(k,j);
      }
    }
  }

  fp = fopen("data.bin", "wb");

  fwrite(memA, sizeof (int), (N1*N2), fp);
  //fwrite(memB, sizeof (int), (N2*N3), fp);

#if 1
  printf("\n");
  for (i = 0; i < N1; ++i) {
    for (j = 0; j < N2; ++j) {
      printf ("%d ", MEMA(i,j));
    }
    printf("\n");
  }

#endif

  return 0;
}

/*****************************************************************************/
