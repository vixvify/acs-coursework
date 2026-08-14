#include <stdio.h>

int main() {
    int n;
    int *pi;
    int sum = 0;
    
    scanf("%d",&n);
    int arr[n];
    
    for(int i = 0; i < n; i++){
        scanf("%d",&arr[i]);
    }
    
    pi = arr;
    
    for(int i = 0; i < n; i++){
        sum += *pi;
        pi += 1;
    }
    
    printf("%d",sum);

    return 0;
}