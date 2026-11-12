import java.util.Date;
import java.util.Objects;

public class Plan {
    private String planDetail;
    private Date startDate;

    public String getPlanDetail() {
        return planDetail;
    }

    public void setPlanDetail(String planDetail) {
        this.planDetail = planDetail;
    }

    public Date getStartDate() {
        return startDate == null
                ? null
                : new Date(startDate.getTime());
    }

    public Date setStartDate(Date startDate) {
        this.startDate = new Date(
                Objects.requireNonNull(startDate).getTime());

        return getStartDate();
    }
}