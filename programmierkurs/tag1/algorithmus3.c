#include <stdio.h>
#include <math.h>
int main(){
	float a, x = 2, y = 1;
	printf("Geben Sie eine reelle Zahl größer oder gleich 0 ein.\n");
	scanf("%f", &a);
	while (fabs(x - y) > 1e-10){
		x = y;
		y = (x + a / x) / 2;
	}
	printf("Die Quadratwurzel der gegebenen reellen Zahl ist:\n");
	printf("%f\n", x);
	return 0;
}
