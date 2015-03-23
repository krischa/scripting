#include <stdio.h>
#include <math.h>
int main(){
	int a,b;
	printf("Bitte geben Sie eine natürliche Zahl ein.\n");
	scanf("%i", &a);
	printf("Bitte geben Sie eine weitere natürliche Zahl ein.\n");
	scanf("%i", &b);
	if (a == 0){
		printf("Der ggT ist:\n");
		printf("%i\n", b);
		return 0;
	}
	while (b != 0){
		if (a > b){
			a = a - b;
		}
		else {
			b = b - a;
		}
	}
	printf("Der ggT ist:\n");
	printf("%i\n", a);
	return 0;
}
