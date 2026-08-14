// Pointer Link List

#include <stdio.h>
#include <stdlib.h>

struct Node {
    int value;
    struct Node *next;
};

struct Node* createNode(int value){
    struct Node *s = malloc(sizeof(struct Node));
    s -> value = value;
    s -> next = NULL;
    return s;
}

void addNode(int value,struct Node** head){
    struct Node *newNode = createNode(value);
    if(*head == NULL){
        *head = newNode;
        printf("%d\n", newNode->value);
        return;
    }
    struct Node *temp = *head;
    while(temp->next != NULL){
        temp = temp -> next;
    }
    temp -> next = newNode;
    printf("%d\n", newNode->value);
}

int main() {
    struct Node* head = NULL;
    addNode(25,&head);
    addNode(35,&head);
    addNode(24,&head);
    return 0;
}