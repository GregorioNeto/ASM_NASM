#include <stdio.h>
#include <stdlib.h>

int encriptar(unsigned char key,char* name);
int decriptar(unsigned char key,char* name);

int main(){
	char key,opcao;
	char name[100];
	
	printf("Digite a chave desejada:");
	scanf(" %c",&key);
	printf("Digite o nome do arquivo:");
	scanf(" %s",name);
	
	printf("Opções:\nC - Criptografar\nD - Descriptografar\n=>");
	scanf(" %c",&opcao);
	
	if((opcao == 'C')||(opcao == 'c'))
	{
		encriptar(key,name);
	}else if((opcao == 'D')||(opcao == 'd'))
	{
		decriptar(key,name);
	}else{
		printf("Opção invalida!");
	}
	
	return 0;
}
