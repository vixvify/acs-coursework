import java.util.List;
import java.util.Objects;

public class Employee extends Person {
    private String companyID;
    private String title;

    private final Division division;
    private final List<Child> children;

    public Employee(Division division, List<Child> children) {
        this.division = Objects.requireNonNull(division);
        this.children = List.copyOf(
                Objects.requireNonNull(children));
    }

    public String getCompanyID() {
        return companyID;
    }

    public void setCompanyID(String companyID) {
        this.companyID = companyID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}