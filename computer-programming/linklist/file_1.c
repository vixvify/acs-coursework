
#include <stdio.h>

int main()
{
    FILE *fp = fopen("test.txt","w");
    if(fp == NULL){
        printf("cannot open file");
    }
    fprintf(fp,"Hello C File!");
    fclose(fp);
    
    fp = fopen("test.txt","r");
    int ch;
    while ((ch = fgetc(fp)) != EOF) {
        putchar(ch);
    }
 

    return 0;
}
