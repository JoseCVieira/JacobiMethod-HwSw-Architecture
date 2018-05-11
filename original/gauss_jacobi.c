#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define MATZISE 100
#define MAX_ERROR 0.0000001

void print_vector(float vector[]) {
    int i;
    
    for(i = 0; i < MATZISE; i++)
        printf("%f\n", vector[i]);
}

void print_matrix(float matrix[MATZISE][MATZISE]) {
    int i, j;
    
    for(i = 0; i < MATZISE; i++) {
        for(j = 0; j < MATZISE; j++)
            printf("%f ", matrix[i][j]);
        printf("\n");
    }
}

void show_results(float A[MATZISE][MATZISE], float B[MATZISE], float X[MATZISE], int n_it) {
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
    printf("\nM=\n%d\n\n", n_it);
}

void main() {
    float A[MATZISE][MATZISE], X[MATZISE], B[MATZISE], x[MATZISE], aux[MATZISE];
    int i, j, n_it = 0;
    float total, normVal = MAX_ERROR +1, sum;
    time_t t;
    
    srand((unsigned) time(&t)); // seed
    
    // init
    for(i = 0; i < MATZISE; i++){
        X[i] = rand() / (float) RAND_MAX * 20 - 10; // rand()=>[-10;10]
        B[i] = rand() / (float) RAND_MAX * 20 - 10;
    }

    for(i = 0; i < MATZISE; i++){
        sum = 0;
        for(j = 0; j < MATZISE; j++){
            A[i][j] = rand() / (float) RAND_MAX * 20 - 10;
            sum += fabs(A[i][j]);
        }
        sum -= fabs(A[i][i]);
        if(sum > fabs(A[i][i]))
            A[i][i] = ++sum;    // diagonally dominant matrix
    }
    
    // gauss jacobi
    while (normVal > MAX_ERROR){
        for (i = 0; i < MATZISE; i++)
            x[i] = X[i];
        
        for (i = 0; i < MATZISE; i++){
            total=0;
            for (j = 0; j < MATZISE; j++)
                if (j != i) 
                    total += A[i][j]*X[j];
            X[i]=(1/A[i][i])*(B[i]-total);
        }

        total=0;
        for (i = 0; i < MATZISE; i++) //norm
            total += (x[i] - X[i]) * (x[i] - X[i]);
        //normVal = sqrt(total);
        normVal = total;
        
        n_it++;
    }
    
    show_results(A, B, X, n_it);
    
}
