#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "xtime_l.h"

#define MATZISE 8
#define INT_SIZE 4
#define S_MATRIX_A INT_SIZE * MATZISE * MATZISE
#define S_MATRIX_B INT_SIZE * MATZISE
#define S_MATRIX_X INT_SIZE * MATZISE
#define MAX_ERROR 0.0000001

volatile int *memA, *memB, *memX;

#define MEMA(I,J) 	(memA[(I)*MATZISE+(J)])
#define MEMB(I) 	(memB[(I)])
#define MEMX(I) 	(memX[(I)])

#define MATA_START_ADD 0x10000000
#define MATB_START_ADD (MATA_START_ADD + S_MATRIX_A)
#define MATX_START_ADD (MATA_START_ADD + S_MATRIX_A + S_MATRIX_B)

void print_vector(int *vector) {
    int i;

    for(i = 0; i < MATZISE; i++)
        printf("%d\n", vector[i]);
}

void print_matrix(int matrix[MATZISE][MATZISE]) {
    int i, j;

    for(i = 0; i < MATZISE; i++) {
        for(j = 0; j < MATZISE; j++)
            printf("%d ", matrix[i][j]);
        printf("\n");
    }
}

void show_results(float A[MATZISE][MATZISE], int B[MATZISE], int X[MATZISE],
		int n_it, unsigned long long int clock_cycles, float u_sec) {

    int i, j;
    float aux[MATZISE] = {0};

    printf("\n\n-- Gauss Jacobi\n\n=> [A]*[X]=[B], A[n*n], X[n*1], B[n*1]\n\n");
    printf("A => coefficient matrix\n");
    printf("B => multiplication result\n");
    printf("X => solution\n");
    printf("M => nb iterations\n");

    printf("\nA=\n");
    print_matrix(A);
    printf("\nB=\n");
    print_vector(B);
    printf("\nX=\n");
    print_vector(X);
    printf("\n|B-(A*X)|=\n");

    for(i = 0; i < MATZISE; i++){
        for(j = 0; j < MATZISE; j++)
            aux[i] += A[i][j]*X[j];

        aux[i] = fabs(B[i]-aux[i]);
    }
    print_vector(aux);
    printf("\nM=\n%d\n", n_it);

    printf("\nclock cycles=\n%llu\n", clock_cycles);
	printf("\ntime(us)=\n%.2f\n\n", u_sec);
}


float norm_vector(float vector[]) {
    int i;
    float sum = 0;

    for (i = 0; i < MATZISE; i++)
        sum += vector[i] * vector[i];

    //return sqrt(sum);
    return sum;
}

int main() {
    float x[MATZISE], aux[MATZISE];
    float total, normVal = MAX_ERROR +1;
    int i, j, n_it = 0;
    XTime tStart, tEnd;

    memA = (int *)(MATA_START_ADD);
	memB = (int *)(MATB_START_ADD);
	memX = (int *)(MATX_START_ADD);

    XTime_GetTime(&tStart); // start measuring time

    // gauss jacobi
    while (normVal > MAX_ERROR){
        for (i = 0; i < MATZISE; i++)
            x[i] = MEMX(i);

        for (i = 0; i < MATZISE; i++){
            total=0;
            for (j = 0; j < MATZISE; j++)
                if (j != i)
                    total += MEMA(i,j)*MEMX(j);
            MEMX(i)=(1/MEMA(i,i))*(MEMB(i)-total);
        }

        for (i = 0; i < MATZISE; i++)
            aux[i] = x[i] - MEMX(i);

        normVal = norm_vector(aux);

        n_it++;
    }

    XTime_GetTime(&tEnd); // end measuring time

    show_results(memA, memB, memX, n_it, 2 * (tEnd - tStart), 1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

    return 0;
}