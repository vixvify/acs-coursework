#include <stdio.h>

int main(){
    int number = 0;
    scanf("%d",&number);

    while(number!=0) {
        printf("%d\n",number);
        number--;
    }

    return 0;
}