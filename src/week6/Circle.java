public class Circle extends Shape {
    private double radius;

    public Circle() {
        super();
        this.radius = randomInRange(1, 25);
    }

    public Circle(double x, double y, double radius) {
        super(x, y);
        this.radius = radius;
    }

    @Override
    public void move(double newX, double newY) {
        this.x = newX;
        this.y = newY;
    }

    @Override
    public void translate(double dx, double dy) {
        this.x += dx;
        this.y += dy;
    }

    @Override
    public void rotate(double degree) {
        // 원은 회전해도 형태가 동일하므로 회전값을 유지하지 않는다.
        this.rotation = 0;
    }

    @Override
    public double getArea() {
        return Math.PI * radius * radius;
    }

    @Override
    public String getInfo() {
        return String.format(
                "Circle [x=%.2f, y=%.2f, radius=%.2f, rotation=%.2f, area=%.2f]",
                x,
                y,
                radius,
                rotation,
                getArea());
    }
}
