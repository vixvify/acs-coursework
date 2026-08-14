#include <stdio.h>

int main() {
    int num = 42;
    float pi = 3.14;
    char text[] = "hello";
    
    printf("address of num is %d \n",&num);
    printf("address of pi is %d \n",&pi);
    printf("address of text is %d",text);

    return 0;
}