#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int* Addvetor(int *v1, int *v2);
int* AddvetorMMX(int *v1, int *v2);

int main(int argc, char const *argv[])
{
	int vetor1[1000000], vetor2[1000000], *res;
	srand(time(NULL));

	for(int i = 0; i < 1000000; i++){
		vetor1[i] = rand() % 100;
		vetor2[i] = rand() % 100; 
		
	}

	res = AddvetorMMX(vetor1, vetor2);

	for(int i = 0; i < 1000000; i++){
		printf("Vetor 1 - Indice %d: %d", i,vetor1[i]);
		printf("\t Vetor 2 - Indice %d: %d", i, vetor2[i]);
		printf("\n");
		printf("\t Resultado - Indice %d: %d", i, *(res+i));
		printf("\n");
	}
	
	return 0;
}