#include <stdio.h>

int calFac(int n) {
    if (n == 0) return 1;
    if (n == 1) return 1;
    return n * calFac(n - 1);
}

int main(){
    int number = 0;
    scanf("%d",&number);
    printf("%d",calFac(number));
    return 0;
}