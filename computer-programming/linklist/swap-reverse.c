#include <stdio.h>
#include <stdlib.h>

struct Node {
    int value;
    struct Node *next;
};

struct Node* createNode(int value){
    struct Node* address = malloc(sizeof(struct Node));
    address -> value = value;
    address -> next = NULL;
    return address;
}

void appendNode(struct Node** head,int value){
    struct Node *newNode = createNode(value);
    if(*head == NULL){
        *head = newNode;
        return;
    }
    struct Node *temp = *head;
    while(temp -> next != NULL){
        temp = temp -> next;
    }
    temp -> next = newNode;
}

void showNode(struct Node* head){
    struct Node *temp = head;
    while(temp != NULL){
        printf("%d ",temp->value);
        temp = temp -> next;
    }
}

void swapNode(struct Node **head,int pos1,int pos2){
    struct Node *a = NULL,*b = NULL,*prev = NULL,*preva = NULL,*prevb = NULL;
    int count = 1;
    struct Node* temp = *head;
    while(temp != NULL){
        if(count == pos1){
            a = temp;
            preva = prev;
        }
        else if(count == pos2){
            b = temp;
            prevb = prev;
        }
        count++;
        prev = temp;
        temp = temp -> next;
    }
    if(preva == NULL){
        *head = b;
    }
    else{
        preva -> next = b;
    }
    if(prevb == NULL){
        *head = a;
    }
    else{
        prevb -> next = a;
    }
    
    struct Node* tempnode = a -> next;
    a -> next = b ->next;
    b -> next = tempnode;
}

struct Node *reverse(struct Node **head){
    struct Node *prev = NULL,*curr = *head,*next = NULL;
    
    while(curr != NULL){
        next = curr -> next;
        curr -> next = prev;
        prev = curr;
        curr = next;
    }
    return prev;
}

int main() {
    struct Node *head = NULL;  
    appendNode(&head,10);
    appendNode(&head,20);
    appendNode(&head,30);
    appendNode(&head,40);
    appendNode(&head,50);
    showNode(head);
    printf("\n");
    swapNode(&head,2,3);
    showNode(head);
    swapNode(&head,2,3);
    printf("\n");
    head = reverse(&head);
    showNode(head);
    return 0;
}
