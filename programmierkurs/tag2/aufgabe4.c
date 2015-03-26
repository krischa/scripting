#include <stdio.h>
#include <math.h>

int main(){
int counter = 1, obergrenze, summe = 0;
printf("Geben Sie eine natürliche Zahl als Obergrenze an.\n");
scanf("%i", &obergrenze);
while (counter <= obergrenze){
	if ((counter%3 == 0 )||(counter%5 == 0)){
		summe = summe + counter;
	}
counter = counter + 1;
}
printf("Die Summe der Vielfachen von 3 und 5 bis zum eingegebenen Wert ist %i\n", summe);
return 0;
}
