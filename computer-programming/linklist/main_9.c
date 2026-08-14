// Swap Node

#include <stdio.h>
#include <stdlib.h>

struct Node {
    int value;
    struct Node *next;
};

struct Node *createNode(int value){
    struct Node *address = malloc(sizeof(struct Node));
    address -> value = value;
    address -> next = NULL;
    return address;
}

void addNode(struct Node** head,int value){
    struct Node *newNode = createNode(value);
    if(*head == NULL){
        *head = newNode;
        printf("%d\n",newNode->value);
        return;
    }
    struct Node *temp = *head;
    while(temp -> next != NULL){
        temp = temp->next;
    }
    temp->next = newNode;
    
    printf("%d\n",newNode->value);
}

void swapNode(struct Node **head,int pos1,int pos2){
    if(*head == NULL) return;
    int count = 1;
    struct Node *a = NULL,*b = NULL,*prev = NULL,*preva = NULL,*prevb = NULL;
    
    struct Node *temp = *head;
    
    while(temp != NULL){
        if(pos1 == count){
            a = temp;
            preva = prev;
        }
        else if(pos2 == count){
            b = temp;
            prevb = prev;
            
        }
        prev = temp;
        count++;
        temp = temp -> next;
    }
    if (a == NULL || b == NULL) return;

    if (preva == NULL) {
        *head = b;            
    } else {
        preva->next = b;
    }

    
    if (prevb == NULL) {
        *head = a;             
    } else {
        prevb->next = a;
    }

    struct Node *tempNext = a->next;
    a->next = b->next;
    b->next = tempNext;
    
    //currect data
    temp = *head;
    while(temp != NULL){
        printf("%d\n",temp->value);
        temp = temp->next;
    }
}


int main() {
    struct Node *head = NULL;
    addNode(&head,10);
    addNode(&head,20);
    addNode(&head,30);
    addNode(&head,40);
    addNode(&head,50);
    swapNode(&head,1,4);
    return 0;
}
