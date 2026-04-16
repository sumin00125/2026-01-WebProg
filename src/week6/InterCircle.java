import java.util.Random;

public class InterCircle implements InterShape {
    private static final Random RANDOM = new Random();

    private InterShapeCounter counter;
    private double x;
    private double y;
    private double radius;
    private double rotation;

    public InterCircle(InterShapeCounter counter) {
        this.counter = counter;
        this.x = randomInRange(0, 100);
        this.y = randomInRange(0, 100);
        this.radius = randomInRange(1, 25);
        this.rotation = 0;
        this.counter.increaseCount();
    }

    public InterCircle(InterShapeCounter counter, double x, double y, double radius) {
        this.counter = counter;
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.rotation = 0;
        this.counter.increaseCount();
    }

    private double randomInRange(double min, double max) {
        return min + (max - min) * RANDOM.nextDouble();
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
        this.rotation = 0;
    }

    @Override
    public double getArea() {
        return Math.PI * radius * radius;
    }

    @Override
    public String getInfo() {
        return String.format(
                "InterCircle [x=%.2f, y=%.2f, radius=%.2f, rotation=%.2f, area=%.2f]",
                x,
                y,
                radius,
                rotation,
                getArea());
    }
}
