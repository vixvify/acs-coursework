abstract class Employee {
    protected Number id;
    protected String name;

    Employee(Number id, String name) {
        this.id = id;
        this.name = name;
    }

    abstract double calculatePay();

    abstract String summary();

    String getName() {
        return name;
    }

}

class SalariedEmployee extends Employee {
    private double monthlySalary;

    SalariedEmployee(Number id, String name, double monthlySalary) {
        super(id, name);
        if (monthlySalary < 0) {
            throw new IllegalArgumentException("Monthly salary cannot be negative");
        }
        this.monthlySalary = monthlySalary;
    }

    @Override
    double calculatePay() {
        return monthlySalary;
    }

    @Override
    String summary() {
        return id + " - " + name + "pay = " + calculatePay();
    }
}

class HourlyEmployee extends Employee {
    private double hourlyRate;
    private Number hoursWorked;

    HourlyEmployee(Number id, String name, double hourlyRate, Number hoursWorked) {
        super(id, name);
        this.hourlyRate = hourlyRate;

        if (hoursWorked.doubleValue() < 0 || hourlyRate < 0) {
            throw new IllegalArgumentException("Hours worked and hourly rate cannot be negative");
        }
        this.hoursWorked = hoursWorked;
    }

    @Override
    double calculatePay() {
        return hourlyRate * hoursWorked.doubleValue();
    }

    @Override
    String summary() {
        return id + " - " + name + "pay = " + calculatePay();
    }
}

class PayrollApp {
    public static void main(String[] args) {

        Employee[] employees = {
                new SalariedEmployee(1, "John Doe", 40000),
                new HourlyEmployee(2, "Jane Smith", 500, 5)
        };

        double totalPay = 0;

        for (Employee emp : employees) {
            System.out.println(emp.summary());
            totalPay += emp.calculatePay();
        }

        System.out.println("Total = " + totalPay);

    }
}