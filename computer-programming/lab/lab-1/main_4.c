#include <stdio.h>

int main(){
    int number = 0;
    scanf("%d",&number);

    for (int i = 1; i<=12; i++) {
        printf("%d x %d = %d \n",number,i,number*i);
    }

    return 0;
}