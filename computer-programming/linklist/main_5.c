#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Node {
  char name[10];
  int age;
  struct Node *next;
};

struct Node* createNode(char name[],int age){
    struct Node *address = malloc(sizeof(struct Node));
    strcpy(address->name,name);
    address -> age = age;
    address -> next = NULL;
    return address;
}

void addNode(struct Node **head,char name[],int age){
    struct Node* newNode = createNode(name,age);
    if(*head == NULL){
        *head = newNode;
        printf("%s\n",newNode->name);
        printf("%d\n\n",newNode->age);
        return;
    }
    struct Node *temp = *head;
    while(temp -> next != NULL){
        temp = temp -> next;
    }
    temp -> next = newNode;
    printf("%s\n",newNode->name);
    printf("%d\n\n",newNode->age);
}

struct Node *searchNode(struct Node **head,char key[]){
    struct Node *temp = *head;
    while(temp != NULL && strcmp(temp->name, key) != 0){
        temp = temp -> next;
    }
    return temp;
}

void deleteNode(struct Node **head,char key[]){
    struct Node *temp = *head;
    struct Node *prev;
    
    if(temp == NULL) return;
    if (strcmp(temp->name, key) == 0) {
        *head = temp->next;   
    }
    while(temp != NULL && strcmp(temp->name,key) != 0){
        prev = temp;
        temp = temp -> next;
    }
    
    if(temp -> next == NULL){
        prev -> next = NULL;
    }
    else{
        prev -> next = temp -> next;
    }
    
    // currect data
    temp = *head;
    while(temp != NULL){
        printf("%s\n",temp->name);
        printf("%d\n\n",temp->age);
        temp = temp->next;
    }
}

void updateNode(struct Node **head,char key[],char newname[],int newage){
    struct Node *temp = *head;
    if(temp == NULL) return;
    
    while(temp != NULL && strcmp(temp->name,key) != 0){
        temp = temp -> next;
    }
    strcpy(temp->name,newname);
    temp -> age = newage;
    
    // currect data
    temp = *head;
    while(temp != NULL){
        printf("%s\n",temp->name);
        printf("%d\n\n",temp->age);
        temp = temp->next;
    }
}

int main() {
    struct Node *head = NULL;
    addNode(&head,"a",18);
    addNode(&head,"b",19);
    addNode(&head,"c",20);
    addNode(&head,"d",21);
    addNode(&head,"e",22);
    
    struct Node *result = searchNode(&head,"c");
    printf("name = %s , age = %d \n\n",result -> name,result -> age);
    
    printf("-------current data-------");
    printf("\n");
    printf("\n");
    
    deleteNode(&head,"a");
    
    printf("-------update data-------");
     printf("\n");
    printf("\n");
    
    updateNode(&head,"b","z",30);
    return 0;
}
