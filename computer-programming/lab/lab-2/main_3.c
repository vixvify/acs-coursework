#include <stdio.h>

int main() {
   int row = 0;
   int col = 0;

   scanf("%d",&row);
   scanf("%d",&col);
   
   int arr[col][row];
   
   for(int i = 0;i<row;i++){
       for(int j = 0;j<col;j++){
           arr[i][j] = 0;
       }
   }
   
  for(int i = 0;i<row;i++){
      for(int j = 0;j<col;j++){
          int a;
          scanf("%d",&a);
          arr[j][i] = a;
      }
  }
  
  for(int i = 0;i<col;i++){
        for(int j = 0;j<row;j++){
            if(j == row-1){
                printf("%d\n",arr[i][j]);
            }
            else{
                printf("%d ",arr[i][j]);   
            }   
      }
    }
   

    return 0;
}