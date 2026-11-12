import java.util.List;
import java.util.Objects;

public class Division {
    private String divisionName;

    private final List<Function> functions;
    private final List<Plan> plans;

    public Division(List<Function> functions, List<Plan> plans) {
        Objects.requireNonNull(functions);
        Objects.requireNonNull(plans);

        if (functions.isEmpty()) {
            throw new IllegalArgumentException(
                    "Division requires at least one Function");
        }

        this.functions = List.copyOf(functions);
        this.plans = List.copyOf(plans);
    }

    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }
}