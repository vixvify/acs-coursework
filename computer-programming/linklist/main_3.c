// Pointer Update Info in Struct

#include <stdio.h>
#include <string.h>

struct Node {
    char name[10];
    int age;
};

void updateInfo(char name[],int age,struct Node** c){
    struct Node *a = *c;
    strcpy(a -> name,name);
    a -> age = age;
}

int main() {
   struct Node a;
   struct Node* c = &a;
   
   strcpy(c->name, "vixvify");
   c -> age = 17;
   
   printf("name = %s\n",c -> name);
   printf("age = %d\n\n",c -> age);
   
   updateInfo("who",18,&c);
   
   printf("name = %s\n",c -> name);
   printf("age = %d",c -> age);
    return 0;
}