#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define MATZISE 10
#define TOLERANCIA 0.00001

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
    printf("A => matriz com os coeficientes\n");
    printf("B => resultado da multiplicao\n");
    printf("X => solucao\n");
    printf("M => nr de iteracoes\n");
    
    printf("\nA=\n");
    print_matrix(A);
    printf("\nB=\n");
    print_vector(B);
    printf("\nX=\n");
    print_vector(X);
    printf("\nM=\n%d\n", n_it);
    printf("\nA*X=\n");
        
    for(i = 0; i < MATZISE; i++)
        for(j = 0; j < MATZISE; j++)
            aux[i] += A[i][j]*X[j];
        
    print_vector(aux);
    printf("\n");
}

float norm_vector(float vector[]) {
    int i, j;
    float sum = 0.0;

    for (i = 0; i < MATZISE; i++)
        sum += vector[i] * vector[i];
    
    return sqrt(sum);
}

void main() {
    float A[MATZISE][MATZISE], X[MATZISE], B[MATZISE], x[MATZISE], aux[MATZISE];
    int i, j, n_it = 0;
    float total, normVal = TOLERANCIA +1, sum;
    time_t t;
    
    srand((unsigned) time(&t)); // seed
    
    // inicializacoes
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
        if(sum > fabs(A[i][i])) // garante que se trata de uma matriz diagonal dominante
            A[i][i] = sum + 1;
    }
    
    // gauss jacobi
    while (normVal > TOLERANCIA){
        for (i = 0; i < MATZISE; i++)
            x[i] = X[i];
        
        for (i = 0; i < MATZISE; i++){
            total=0;
            for (j = 0; j < MATZISE; j++)
                if (j != i) 
                    total += A[i][j]*X[j];
            X[i]=(1/A[i][i])*(B[i]-total);
        }
        
        for (i = 0; i < MATZISE; i++)
            aux[i] = x[i] - X[i];
        normVal = norm_vector(aux);
        
        n_it++;
    }
    
    show_results(A, B, X, n_it);
}
