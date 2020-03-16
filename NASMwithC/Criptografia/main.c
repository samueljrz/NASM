#include <stdio.h>

typedef char byte;

int encrypt(byte key, char* name);
int decrypt(byte key, char* name);

int main ()	{

	int aux;
	char name[100];
	byte key;

	printf("Deseja encriptar ou decriptar o arquivo?\n0 - encriptar\n1 - decriptar\n");
	scanf("%d", &aux);

	if(aux == 0)	{

		printf("Coloque o valor da chave e o nome do arquivo respectivamente\n");
		scanf(" %s", &key);	
		fgets(name, 100, stdin);
		encrypt(key, name);
	}

	else
		printf("Coloque o valor da chave e do nome do arquivo respectivamente\n");
		scanf(" %s", &key);
		fgets(name, 100, stdin);
		decrypt(key, name);

return 0;

}
