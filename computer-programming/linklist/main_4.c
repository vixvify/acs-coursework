// Array with Malloc

#include <stdio.h>
#include <stdlib.h>


int main() {
   int n;
   scanf("%d",&n);
   int *address = malloc(sizeof(int)*n);
   int *temp = address;
   
   for(int i = 0; i < n ; i++){
       scanf("%d",&*address);
       address++;
   }
   address = temp; 
   for(int i = 0; i < n ; i++){
       printf("%d ",*address);
       address++;
   }
   return 0;
}