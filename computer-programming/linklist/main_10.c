#include <stdio.h>

int main() {
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i = 0; i < n; i++){
        scanf("%d",&arr[i]);
    }
    int *p = arr;
    int last = n;
    for(int i = 0; i < n/2; i++){
       int temp = *(p+i);
       *(p+i) = *(p+(n-i-1));
       *(p+(n-i-1)) = temp;
    }
    for(int i = 0; i < n; i++){
        printf("%d",arr[i]);
    }

    return 0;
}
