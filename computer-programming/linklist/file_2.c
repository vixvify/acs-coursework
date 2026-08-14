
#include <stdio.h>

int main()
{
    FILE *fp = fopen("test.txt","w");
    if(fp == NULL){
        printf("cannot open file");
    }
    fprintf(fp,"vixvify");
    fclose(fp);
    
    fp = fopen("test.txt","r");
    char line[100];

    while (fgets(line, 100, fp)) {
        printf("%s", line);
    }

    return 0;
}
