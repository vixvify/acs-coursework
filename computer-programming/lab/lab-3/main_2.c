#include <stdio.h>

int calFib(int n) {
    if (n<=1) {
        return n;
    }
    return calFib(n-1) + calFib(n-2);
}

int main(){
    int number = 0;
    scanf("%d",&number);
    for (int i = 0; i < number; i++) {
        if (i == 0)
            printf("%d", calFib(i));
        else
            printf(" %d", calFib(i));
    }

    printf("\n");
    return 0;
}