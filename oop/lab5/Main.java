import java.util.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        Function function = new Function();
        function.setFuncDetail("Software Development");
        function.setDespondArea("IT Systems");

        Plan plan = new Plan();
        plan.setPlanDetail("Build new website");
        plan.setStartDate(new Date());

        Division division = new Division(
                List.of(function),
                List.of(plan));
        division.setDivisionName("IT Department");

        Child child = new Child();
        child.setSchoolName("Bangmod School");
        child.setGrade(4);

        Employee employee = new Employee(
                division,
                List.of(child));

        employee.setName("Alice");
        employee.setAge(35);
        employee.setCompanyID("EMP001");
        employee.setTitle("Developer");

        System.out.println("Employee: " + employee.getName());
        System.out.println("Age: " + employee.getAge());
        System.out.println("ID: " + employee.getCompanyID());
        System.out.println("Title: " + employee.getTitle());

        System.out.println(
                "Division: " + division.getDivisionName());

        System.out.println(
                "Child school: " + child.getSchoolName());
        System.out.println(
                "Child grade: " + child.getGrade());

        System.out.println(
                "Function: " + function.getFuncDetail());
        System.out.println(
                "Responsible area: " + function.getRespondArea());
        System.out.println(
                "Plan: " + plan.getPlanDetail());

        System.out.println(
                "Employee is Person: "
                        + (employee instanceof Person));
    }
}