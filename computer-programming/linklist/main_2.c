// Pointer Swap

#include <stdio.h>

void swap(int *a,int *b){
    int aswap,bswap;
    int temp = *b;
    bswap = *a;
    aswap = temp;
    printf("a = %d\n",aswap);
    printf("b = %d",bswap);
    return;
}

int main() {
   int a = 20,b = 40;
   int *pnta = &a, *pntb = &b; 
   swap(pnta,pntb);
    return 0;
}