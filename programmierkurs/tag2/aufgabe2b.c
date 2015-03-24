#include <stdio.h>
#include <math.h>
int main() {
int a, c, n = 2;
printf("Geben Sie eine natürliche Zahl an.\n");
scanf("%i", &c);
while (n*n <= c ){
	if (c == n){
		a = 1;
		break;
	}
	if (c % n == 0){
		c = c + 1;
	}
	else {
	n = n + 1;
	}
}
}
/**if (a == 0){
	printf("Die eingegebene Zahl ist keine Primzahl.\n");
	printf("%i\n", n);
}**/
if (a == 1){
	printf("Die nächst größere Primzahl ist %i.\n", c);
}
return 0;
}
