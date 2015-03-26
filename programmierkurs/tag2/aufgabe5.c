#include <stdio.h>
#include <math.h>

int main(){
int a = 0, n = 2, counter = 1, obergrenze;
printf("Geben Sie eine natürliche Zahl als Obergrenze an.\n");
scanf("%i", &obergrenze);
while (a == 0){
	while (n<=obergrenze){
		if (counter%n != 0){
			counter = counter + 1;
			n = 2;
		}
		else {
			n = n + 1;
		}
		if (n == obergrenze){
			a = 1;
		}
	}
}
printf("Das kgV ist %i\n", counter);
return 0;
}
