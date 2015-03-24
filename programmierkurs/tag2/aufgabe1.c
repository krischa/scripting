#include <stdio.h>
#include <math.h>

int main() {
	int x, n, summe = 0;
	printf("Bitte geben Sie eine natürliche Zahl an:\n");
	scanf("%i", &n);
	for(x = 1; x <= n; x = x + 1) {
		if(x % 2 != 0){
			summe = summe + x;
		}
	}
	printf("Die Summe der ungeraden Zahlen bis %i ist %i.\n", n, summe);
	return 0;
}
