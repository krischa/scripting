#include <stdio.h>
#include <math.h>
int main() {
int a = 1, c, n = 2;
printf("Geben Sie eine natürliche Zahl an.\n");
scanf("%i", &c);
while (n*n < c ){
	if (c % n == 0){
		a = 0;
		break;
	}
	n = n + 1;
}
if (a == 0){
	printf("Die eingegebene Zahl ist keine Primzahl.\n");
	printf("%i\n", n);
}
if (a == 1){
	printf("Die eingegebene Zahl ist eine Primzahl.\n");
}
return 0;
}
