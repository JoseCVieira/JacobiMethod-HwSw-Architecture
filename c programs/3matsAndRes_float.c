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


#define MEMA(I,J) (memA[(I)*N2+(J)])
#define MEMB(I,J) (memB[(I)*N3+(J)])
#define MEMX(I,J) (memX[(I)*N3+(J)])
#define MEMC(I,J) (memC[(I)*N3+(J)])

int main(int argc, char *argv[])
{
  int N1, N2, N3;
  float  *memA, *memB, *memC, *memX;
  int i=0, j=0, k=0;

  FILE *fp;

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

  memA = calloc(N1*N2, sizeof (float)) ;
  memB = calloc(N2*N3, sizeof (float)) ;
  memX = calloc(N2*N3, sizeof (float)) ;
  memC = calloc(N1*N3, sizeof (float)) ;

      float soma =1.5f;
      printf("soma: %f\n",soma );

  srand(time(NULL));
  for (i = 0; i < N1; ++i) {
    soma =0;
    for (j = 0; j < N2; ++j) {
      MEMA(i,j) = ((float)rand()/(float)(999)-(RAND_MAX/2000));
      soma += abs(MEMA(i,j));
    }
    MEMA(i,i)= soma*soma*1000;
  }
  for (i = 0; i < N2; ++i) {
    for (j = 0; j < N3; ++j) {
      MEMB(i,j) = ((float)rand()/(float)(999)-(RAND_MAX/2000));
    }
  }
  for (i = 0; i < N2; ++i) {
    for (j = 0; j < N3; ++j) {
      MEMX(i,j) = ((float)rand()/(float)(999)-(RAND_MAX/2000));
    }
  }

  for (i = 0; i < N1; ++i) {
    for (j = 0; j < N3; ++j) {
      MEMC(i,j) = 0;
      for (k = 0; k < N2; k++) {
	MEMC(i,j) += MEMA(i,k) * MEMX(k,j);
      }
    }
  }

  fp = fopen("data.bin", "wb");

  fwrite(memA, sizeof (float), (N1*N2), fp);
  fwrite(memB, sizeof (float), (N2*N3), fp);
  fwrite(memX, sizeof (float), (N2*N3), fp);

#if 1
printf("MEMA\n");
for (i = 0; i < N1; ++i) {
  for (j = 0; j < N2; ++j) {
    printf ("%f ", MEMA(i,j));
  }
  printf("\n");
}

printf("MEMB\n");
for (i = 0; i < N2; ++i) {
  for (j = 0; j < N3; ++j) {
    printf ("%f ", MEMB(i,j));
  }
  printf("\n");
}

printf("MEMX\n");
for (i = 0; i < N2; ++i) {
  for (j = 0; j < N3; ++j) {
    printf ("%f ", MEMX(i,j));
  }
  printf("\n");
}

printf("MEMC\n");
for (i = 0; i < N1; ++i) {
  for (j = 0; j < N3; ++j) {
    printf ("%f ", MEMC(i,j));
  }
  printf("\n");
}

#endif

  return 0;
}

/*****************************************************************************/
