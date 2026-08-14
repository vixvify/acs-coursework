#include <stdio.h>

int findMax(int arr[] , int n, int max) {
    if (n < 0) return max;
    if (max < arr[n]) {
        return findMax(arr, n-1, arr[n]);
    }
    if (max >= arr[n]) {
        return findMax(arr, n-1, max);
    }
}

int main(){
    int n;
    int arr[100];
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }
    printf("max value is : %d", findMax(arr,n-1,arr[n-1]));
    return 0;
}