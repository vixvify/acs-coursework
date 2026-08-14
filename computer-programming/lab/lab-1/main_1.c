#include <stdio.h>

int main(){
    int number = 0;
    scanf("%d",&number);

    if (number % 2 != 0) {
        printf("Odd");
    }
    else {
        printf("Even");
    }

    return 0;
}