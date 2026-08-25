public class reg {
    private double width, height;

    public reg(double w, double h) {
        if (w < 0 || h < 0) {
            throw new IllegalArgumentException("Width and height must be non-negative.");
        }
        this.width = w;
        this.height = h;
    }

    public reg() {
        this(0, 0);
    }

    public reg(double w) {
        this(w, w);
    }

    public reg(reg other) {
        this(other.width, other.height);
    }

    public double getArea() {
        return width * height;
    }

    public double getPerimeter() {
        return 2 * (width + height);
    }
}