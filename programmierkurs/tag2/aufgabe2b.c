#include <stdio.h>
#include <math.h>
int main() {
int c, n = 2;
printf("Geben Sie eine natürliche Zahl an.\n");
scanf("%i", &c);
while (n*n <= c ){
	if (c % n == 0){
		c = c + 1;
		n = 2;
	}
	else {
		n = n + 1;
	}
}
/**if (a == 0){
	printf("Die eingegebene Zahl ist keine Primzahl.\n");
	printf("%i\n", n);
}**/
printf("Die nächste Primzahl ist %i\n", c);
return 0;
}
