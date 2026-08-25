abstract class Employee {
    protected String name;

    Employee(String name) {
        this.name = name;
    }

    abstract double calculatePay();

    abstract String summary();

}

class SalariedEmployee extends Employee {
    private double monthlySalary;

    SalariedEmployee(String name, double monthlySalary) {
        super(name);
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
        return name + "pay = " + calculatePay() + " THB";
    }
}

class HourlyEmployee extends Employee {
    private double hourlyRate;
    private Number hoursWorked;

    HourlyEmployee(String name, double hourlyRate, Number hoursWorked) {
        super(name);
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
        return name + "pay = " + calculatePay() + " THB";
    }
}

class PayrollApp {
    public static void main(String[] args) {

        Employee[] employees = {
                new SalariedEmployee("John Doe", 40000),
                new HourlyEmployee("Jane Smith", 500, 5)
        };

        double totalPay = 0;

        for (Employee emp : employees) {
            System.out.println(emp.summary());
            totalPay += emp.calculatePay();
        }

        System.out.println("Total = " + totalPay);

    }
}