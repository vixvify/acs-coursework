#include <stdio.h>
#include <string.h>

int main() {
   
   int a = 1;
   char words[100];
   
   scanf("%s",words);
   int length = (strlen(words));
   
   if(length % 2 == 0){
       for(int i = 0;i<length;i++){
           if(words[i] != words[length-(i+1)]){
               a = 0;
               break;
           }
       }
   }
   else{
       for(int i = 0;i<length;i++){
           if(i > length/2){
               break;
           }
           else if(words[i] != words[length-(i+1)]){
               a = 0;
               break;
           }
       }
   }
   
   if(a == 1){
       printf("Palindrome");
   }
   else{
       printf("Not Palindrome");
   }
   
    
   

    return 0;
}