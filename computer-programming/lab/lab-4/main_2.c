#include <stdio.h>
#include <string.h>
int checkWord(char word[], int i, int n) {
    if (i >= n) return 1;
    if (word[i] == word[n])
        return checkWord(word, i + 1, n - 1);
    return 0;
}int main() {
    char word[100];
    printf("Enter a word: ");
    scanf("%s", word); int n = strlen(word) - 1;
    int i = 0; int status = checkWord(word, i, n);
    if (status == 1)
        printf("Palindrome\n");
    else
        printf("Not palindrome\n"); return 0;
}