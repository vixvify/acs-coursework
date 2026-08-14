#include <stdio.h>

int main(){
    int number = 0;
    scanf("%d",&number);

    if (number >= 80 && number <= 100) {
        printf("Grade A");
    }
    else if (number >= 70 && number < 80) {
        printf("Grade B");
    }
    else if (number >= 60 && number < 70) {
        printf("Grade C");
    }
    else if (number >= 50 && number < 60) {
        printf("Grade D");
    }
    else{
        printf("Grade F");
    }

    return 0;
}