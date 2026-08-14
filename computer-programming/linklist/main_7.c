// Mean
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Person { char name[20]; int age; };

float calAge(struct Person *s[]){
    float total =0;
    for(int i = 0;i<3;i++){
        total += s[i] -> age;
    }
    total = total / 3;
    return total;
}

int main() {
    struct Person s1,s2,s3;
    struct Person *ps1 = &s1, *ps2 = &s2, *ps3 = &s3;
    
    strcpy(ps1 -> name,"A");
    ps1 -> age = 10;
    strcpy(ps2 -> name,"B");
    ps2 -> age = 20;
    strcpy(ps3 -> name,"C");
    ps3 -> age = 30;
    
    struct Person *arr[3] = {ps1,ps2,ps3};
    printf("%.2f",calAge(arr));
    
    return 0;
}
