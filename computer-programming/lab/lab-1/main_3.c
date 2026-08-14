#include <stdio.h>

int main(){
    int number = 0;
    scanf("%d",&number);

    switch(number) {
        case 1:
            printf("You choose option 1");
            break;
        case 2:
            printf("You choose option 2");
            break;
        case 3:
            printf("You choose option 3");
            break;
        default:
            printf("Invalid choice");
            break;
    }

    return 0;
}