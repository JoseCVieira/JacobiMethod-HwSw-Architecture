#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define true 1
#define false 0
   
#define MATZISE 3
#define ITERACOES 3
#define TOLERANCIA 0.00001
#define MAX_IT 1000

void init_print() {
    printf("\n\n-- Gauss Jacobi\n\n=> [A]*[X]=[B], A[n*n], X[n*1], B[n*1]\n\n");
    printf("A => matriz com os coeficientes\n");
    printf("B => resultado da multiplicao\n");
    printf("X => solucao\n");
    printf("M => nr max de iteracoes\n");
    printf("E => tolerancia\n");
}

void print_vector(int vector[]) {
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

void main() {
    int A[MATZISE][MATZISE], X[MATZISE], B[MATZISE];
    int i, j, k, total;
    time_t t;
    
    float E = TOLERANCIA;
    int M = MAX_IT;
    int n_it = 0;
    bool continuar = true;
    
    srand((unsigned) time(&t)); // seed
    
    for(i = 0; i < MATZISE; i++)
        for(j = 0; j < MATZISE; j++)
            A[i][j] = rand() % 9 + 1; // numeros de 1 a 9
        
    for(i = 0; i < MATZISE; i++)
        X[i] = rand() % 10;
    
    for(i = 0; i < MATZISE; i++)
        B[i] = rand() % 10;
    
    for(k = 0; k < ITERACOES; k++){
        for(i = 0; i < MATZISE; i++) {
            total = 0;
            for(j = 0; j < MATZISE; j++) {
                if(i!=j){
                    total += A[i][j] * X[j];
                }
            }
            X[i] = (1/(A[i][i])) * (B[i]-total);
        }
    }
    
    init_print();
    
    printf("\nMatrix A=\n");
    print_matrix(A);
    printf("\nVector B=\n");
    print_vector(B);
    printf("\nVector X=\n");
    print_vector(X);
    printf("\nVector M=\n%d\n", M);
    printf("\nVector E=\n%f\n", E);
    
    printf("\n");
}
