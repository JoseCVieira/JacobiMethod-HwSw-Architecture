#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define MATZISE 8
#define INT_SIZE 4
#define SIZE_A INT_SIZE * MATZISE * MATZISE
#define SIZE_B INT_SIZE * MATZISE
#define SIZE_X INT_SIZE * MATZISE
#define MAX_ERROR 0.0000001

volatile int *memA, *memB, *memX;

#define A(I,J)  (memA[(I)*MATZISE+(J)])
#define B(I)    (memB[(I)])
#define X(I)    (memX[(I)])

#define A_START_ADD 0x10000000
#define B_START_ADD (A_START_ADD + SIZE_A)
#define X_START_ADD (A_START_ADD + SIZE_A + SIZE_B)


void show_results(int n_it) {
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
            printf("%d ", A(i,j));
        printf("\n");
    }
    
    // print B
    
    printf("\nB=\n");
    for(i = 0; i < MATZISE; i++)
        printf("%d\n", B(i));

    // print X

    printf("\nX=\n");
    /*for(i = 0; i < MATZISE; i++)
        printf("%f\n", vector[i]);*/
    for(i = 0; i < MATZISE; i++)
        printf("%d\n", X(i));
    
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
}

int main() {
    float x[MATZISE];
    float total, normVal = MAX_ERROR +1;
    int i, j, n_it = 0;

    memA = (int *)(A_START_ADD);
    memB = (int *)(B_START_ADD);
    memX = (int *)(X_START_ADD);

    // gauss jacobi
    while (normVal > MAX_ERROR){
        for (i = 0; i < MATZISE; i++)
            x[i] = X(i);

        for (i = 0; i < MATZISE; i++){
            total=0;
            for (j = 0; j < MATZISE; j++)
                if (j != i)
                    total += A(i,j)*X(j);
            X(i)=(1/A(i,i))*(B(i)-total);
        }

        normVal = 0;
        for (i = 0; i < MATZISE; i++)
            normVal += (x[i] - X(i))*(x[i] - X(i));
        //normVal = sqrt(normVal);
        
        n_it++;
    }

    show_results(n_it);

    return 0;
}