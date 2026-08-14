#include <stdio.h>

int main() {
    int n;
    int *pi;
    
    scanf("%d",&n);
    int arr[n];
    
    for(int i = 0; i < n; i++){
        scanf("%d",&arr[i]);
    }
    
    int max1 = arr[0];
    int max2;
    pi = arr;
    
    for(int i = 0; i < n; i++){
        if(max1 < *pi){
            max2 = max1;
            max1 = *pi;
        }
        else if(*pi > max2 && *pi < max1){
            max2 = *pi;
        }
        pi += 1;
    }
    
    printf("%d",max2);
    
    return 0;
}