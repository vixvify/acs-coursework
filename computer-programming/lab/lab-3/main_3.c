#include <stdio.h>

int calSum(int n) {
    if (n == 0) {
        return n;
    }
    if (n==1) {
        return n;
    }
    return (n)%10 + calSum(n/10);
}

int main(){
    int number = 0;
    scanf("%d",&number);
    printf("%d",calSum(number));
    return 0;
}