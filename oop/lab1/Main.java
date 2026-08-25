import java.util.Scanner;

void main() {
    Scanner sc = new Scanner(System.in);
    System.out.print("Enter an integer: ");
    int number = sc.nextInt();
    System.out.println("You entered: " + number);
    sc.close();
}