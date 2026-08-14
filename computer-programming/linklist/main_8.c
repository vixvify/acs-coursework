// Check longest name
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Person { char name[20]; int age; };

struct Person *checkName(struct Person *s[]){
    float maxValue;
    float *max = &maxValue;
    struct Person s1;
    struct Person *result = &s1;
    for(int i = 0; i<3;i++){
        if(!*max){
            *max = strlen(s[i]->name);
            *result = *s[i];
            continue;
        }
        else if(*max < strlen(s[i]->name)){
            *max = strlen(s[i]->name);
            *result = *s[i];
        }
    }
    return result;
}

int main() {
    struct Person s1,s2,s3;
    struct Person *ps1 = &s1, *ps2 = &s2, *ps3 = &s3;
    
    strcpy(ps1 -> name,"A");
    ps1 -> age = 10;
    strcpy(ps2 -> name,"BBBBB");
    ps2 -> age = 20;
    strcpy(ps3 -> name,"CCC");
    ps3 -> age = 30;
    
    struct Person *arr[3] = {ps1,ps2,ps3};
    
    struct Person *result = checkName(arr);
    printf("longest name is %s",result->name);

    return 0;
}
