// Pointer Swap 3
#include <stdio.h>

int main() {
    int a = 10,b = 20,c = 30;
    int *pnta = &a, *pntb = &b, *pntc = &c;
    int temp = *pntb;
    b = *pntc;
    c = *pnta;
    a = temp;
    printf("A = %d\n",a);
    printf("B = %d\n",b);
    printf("C = %d",c);

    return 0;
}
