#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define MATZISE 2
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
    float A[MATZISE][MATZISE], X[MATZISE], B[MATZISE], x[MATZISE], aux[MATZISE] = {0};
    int i, j, n_it = 0;
    float total;
    time_t t;
    
    srand((unsigned) time(&t)); // seed
    
    // inicializacoes
    
    for(i = 0; i < MATZISE; i++){
        for(j = 0; j < MATZISE; j++)
            A[i][j] = rand() / (float) RAND_MAX * 10; // valores de 0 a 10
        X[i] = 0;
        B[i] = rand() / (float) RAND_MAX * 10;
    }    
    
    // metudo gauss jacobi
    
    while (n_it < MAX_IT) {
        
        for (i = 0; i < MATZISE; i++) {
            total = 0;
            for (j = 0; j < MATZISE; j++) {
                if (j != i) {
                    total = total + A[i][j]*X[j]/A[i][i];
                }
                x[i] = (B[i]/A[i][i]) - total;
            }
        }
        
        if(abs(norm_vector(x) - norm_vector(X)) < TOLERANCIA) {
            break;
        }else{
            for (i = 0; i < MATZISE; i++){
                X[i] = x[i];
            }
        }
        
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
    printf("\nM=\n%d\n", MAX_IT);
    printf("\nE=\n%f\n", TOLERANCIA);
    printf("\nA*X=\n");
    for(i = 0; i < MATZISE; i++)
        for(j = 0; j < MATZISE; j++)
            aux[i] += A[i][j]*X[j];
    print_vector(aux);
    
    printf("\n");
}
