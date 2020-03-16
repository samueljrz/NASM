#include <stdio.h>

int add(int a, int b);	


int main (int argc, char **argv) {
	int c, d;
	scanf("%d%d", &c, &d);
	printf("%d\n", add(c, d));

return 0;	
}