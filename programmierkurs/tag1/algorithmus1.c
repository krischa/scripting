#include <stdio.h>
int main() {
printf("Geben Sie eine natürliche Zahl an.");
int c = getint();
printf("Geben Sie die Anzahl der Iterationen an.");
int b = getint();
int a = b + 1;
int n = 2;
while (n < a) {
	if (n > sqrt(c)) 
		printf("Ja");
	if (c % n == 0)
		printf("no");
	n = n + 1;
}
return 0
}
