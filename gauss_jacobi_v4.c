#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define MATZISE 5
#define TOLERANCIA 0.001
#define MAX_IT 1000

void init_print() {
    printf("\n\n-- Gauss Jacobi\n\n=> [A]*[X]=[B], A[n*n], X[n*1], B[n*1]\n\n");
    printf("A => matriz com os coeficientes\n");
    printf("B => resultado da multiplicao\n");
    printf("X => solucao\n");
    printf("M => nr de iteracoes\n");
}

void print_vector(float vector[]) {
    int i;
    
    for(i = 0; i < MATZISE; i++)
        printf("%0.3f\n", vector[i]);
}

void print_matrix(float matrix[MATZISE][MATZISE]) {
    int i, j;
    
    for(i = 0; i < MATZISE; i++) {
        for(j = 0; j < MATZISE; j++)
            printf("%0.3f ", matrix[i][j]);
        printf("\n");
    }
}

float norm_vector(float vector[]) {
    int i, j;
    float sum = 0.0;

    for (i = 0; i < MATZISE; i++)
        sum += vector[i] * vector[i];
    
    return sqrt(sum);
}

void main() {
    float x[MATZISE], aux[MATZISE] = {0};
    int i, j, n_it = 0;
    float total, normVal = TOLERANCIA +1;
    
    // inicializacoes    
    float A[MATZISE][MATZISE] = {{5, -2, 3, 0, 6}, {-3, 9, 1, -2, 7.4}, {2, -1, -7, 1, 6.7}, {4, 3, -5, 7, 9}, {2, 3.5, 6.1, -4, -8.1}};
    float B[MATZISE] = {-1, 2, 3, 0.5, 3.1};
    float X[MATZISE] = {0.9937, 0.2187, 0.1058, 0.1097, 0.0636};
    
    // metudo gauss jacobi
    while (normVal > TOLERANCIA){
        for (i = 0; i < MATZISE; i++){
            x[i] = X[i];
        }
        
        for (i = 0; i < MATZISE; i++){
            total=0;
            for (j = 0; j < MATZISE; j++)
                if (j != i) 
                    total += A[i][j]*X[j];
            X[i]=(1/A[i][i])*(B[i]-total);
        }
        
        for (i = 0; i < MATZISE; i++){
            aux[i] = x[i] - X[i];
        }
        normVal=norm_vector(aux);
        
        n_it++;
    }
        
    // prints
    init_print();
    
    printf("\nA=\n");
    print_matrix(A);
    printf("\nB=\n");
    print_vector(B);
    printf("\nX=\n");
    print_vector(X);
    printf("\nM=\n%d\n", n_it);
    printf("\nA*X=\n");
    
    for(i = 0; i < MATZISE; i++)
        aux[i] = 0;
        
    for(i = 0; i < MATZISE; i++)
        for(j = 0; j < MATZISE; j++)
            aux[i] += A[i][j]*X[j];
    print_vector(aux);
    
    printf("\n");
}
