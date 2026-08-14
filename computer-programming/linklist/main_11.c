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
}

struct Node* reverse(struct Node *head) {
    struct Node *prev = NULL;
    struct Node *curr = head;
    struct Node *next = NULL;

    while (curr != NULL) {
        next = curr->next;   
        curr->next = prev;   

        prev = curr;        
        curr = next;        
    }
    return prev; 
}

void showNode(struct Node **head){
    struct Node *temp = *head;
    while(temp != NULL){
        printf("%d ",temp -> value);
        temp = temp -> next;
    }
}


int main() {
    struct Node *head = NULL;
    addNode(&head,10);
    addNode(&head,20);
    addNode(&head,30);
    addNode(&head,40);
    addNode(&head,50);
    
    head = reverse(head);
    showNode(&head);
    
    return 0;
}
