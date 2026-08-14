#include <stdio.h>

int main(){
    int number = 0;
    int sum = 0;
    scanf("%d",&number);

    for (int i = 1; i<=number; i++) {
        sum += i;
    }

    printf("Sum = %d",sum);

    return 0;
}