import java.util.Scanner;

void main() {
    Scanner scanner = new Scanner(System.in);

    System.out.print("Enter width: ");
    double width = scanner.nextDouble();

    System.out.print("Enter height: ");
    double height = scanner.nextDouble();

    System.out.print("================\n");

    reg rectangle1 = new reg(width, height);
    System.out.println("Area: " + rectangle1.getArea());
    System.out.println("Perimeter: " + rectangle1.getPerimeter());

    System.out.print("================\n");

    reg rectangle2 = new reg(width);
    System.out.println("Area of square: " + rectangle2.getArea());
    System.out.println("Perimeter of square: " + rectangle2.getPerimeter());

    System.out.print("================\n");

    reg rectangle3 = new reg();
    System.out.println("Area of default rectangle: " + rectangle3.getArea());
    System.out.println("Perimeter of default rectangle: " + rectangle3.getPerimeter());

    System.out.print("================\n");

    reg rectangle4 = new reg(rectangle1);
    System.out.println("Area of copied rectangle: " + rectangle4.getArea());
    System.out.println("Perimeter of copied rectangle: " + rectangle4.getPerimeter());

    scanner.close();

}