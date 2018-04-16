#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "xtime_l.h"

#define MATZISE 8
#define INT_SIZE 4
#define SIZE_A INT_SIZE * MATZISE * MATZISE
#define SIZE_B INT_SIZE * MATZISE
#define SIZE_X INT_SIZE * MATZISE
#define SIZE_A_D_INV INT_SIZE * MATZISE

#define MAX_ERROR 0.0000001

volatile int *memA, *memB, *memX;
volatile float *memA_D_Inv;

#define A(I,J)      (memA[(I)*MATZISE+(J)])
#define B(I)        (memB[(I)])
#define X(I)        (memX[(I)])
#define A_D_INV(I)  (memA_D_Inv[(I)])

#define A_START_ADD 0x10000000
#define B_START_ADD (A_START_ADD + SIZE_A)
#define X_START_ADD (A_START_ADD + SIZE_A + SIZE_B)
#define A_D_INV_ADD (A_START_ADD + SIZE_A + SIZE_B + SIZE_X)

void show_results(int n_it, float* X_f, unsigned long long int clock_cycles, float u_sec) {
    float aux[MATZISE] = {0};
    int i, j;

    printf("\n\n-- Gauss Jacobi\n\n=> [A]*[X]=[B], A[n*n], X[n*1], B[n*1]\n\n");
    printf("A => coefficient matrix\n");
    printf("B => multiplication result\n");
    printf("X => solution\n");
    printf("M => nb iterations\n");

    // print A

    printf("\nA=\n");
    for(i = 0; i < MATZISE; i++) {
        for(j = 0; j < MATZISE; j++)
            printf("%3d ", A(i,j));
        printf("\n");
    }

    // print B

    printf("\nB=\n");
    for(i = 0; i < MATZISE; i++)
        printf("%3d\n", B(i));

    // print X

    printf("\nX=\n");
    for(i = 0; i < MATZISE; i++)
        printf("%f\n", X_f[i]);

    // print erro

    printf("\n|B-(A*X)|=\n");

    for(i = 0; i < MATZISE; i++){
        for(j = 0; j < MATZISE; j++)
            aux[i] += A(i,j)*X(j);
        aux[i] = fabs(B(i)-aux[i]);
    }

    for(i = 0; i < MATZISE; i++)
        printf("%f\n", aux[i]);

    printf("\nM=\n%d\n", n_it);

    printf("\nclock cycles=\n%llu\n", clock_cycles);
    printf("\ntime(us)=\n%.2f\n\n", u_sec);
}

int main() {
    float x[MATZISE], X_f[MATZISE];
    float normVal = MAX_ERROR +1;
    int i, j, n_it = 0;
    XTime tStart, tEnd;

    int total;

    // mem pos
    memA       = (int *)(A_START_ADD);
    memB       = (int *)(B_START_ADD);
    memX       = (int *)(X_START_ADD);
    memA_D_Inv = (float *)(A_D_INV_ADD);

    for (i = 0; i < MATZISE; i++){
        A_D_INV(i) = 1.0f/A(i,i);
        A(i,i) = 0;
    }

    for(i = 0; i < MATZISE; i++)
        X_f[i] = X(i);

    XTime_GetTime(&tStart); // start measuring time

    // gauss jacobi
    //while (normVal > MAX_ERROR){
    for (i = 0; i < MATZISE; i++)
        x[i] = X(i);

    for (i = 0; i < MATZISE; i++){
        total=0;
        for (j = 0; j < MATZISE; j++){
            total += A(i,j)*X(j);
        }
        X_f[i]= (float)A_D_INV(i)*(B(i)-total);
    }

    normVal = 0;
    for (i = 0; i < MATZISE; i++)
        normVal += (x[i] - X(i))*(x[i] - X(i));
    //normVal = sqrt(normVal);

    n_it++;
   // }

    for(i = 0; i < MATZISE; i++)
        X(i) = X_f[i];

    XTime_GetTime(&tEnd); // end measuring time

    show_results(n_it, X_f, 2 * (tEnd - tStart), 1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND / 1000000));

    return 0;
}