import java.util.Random;

public class InterTriangle implements InterShape {
    private static final Random RANDOM = new Random();

    private InterShapeCounter counter;
    private double x;
    private double y;
    private double base;
    private double height;
    private double rotation;

    public InterTriangle(InterShapeCounter counter) {
        this.counter = counter;
        this.x = randomInRange(0, 100);
        this.y = randomInRange(0, 100);
        this.base = randomInRange(1, 40);
        this.height = randomInRange(1, 40);
        this.rotation = randomInRange(0, 360);
        this.counter.increaseCount();
    }

    public InterTriangle(InterShapeCounter counter, double x, double y, double base, double height) {
        this.counter = counter;
        this.x = x;
        this.y = y;
        this.base = base;
        this.height = height;
        this.rotation = 0;
        this.counter.increaseCount();
    }

    private double randomInRange(double min, double max) {
        return min + (max - min) * RANDOM.nextDouble();
    }

    @Override
    public void move(double newX, double newY) {
        this.x = Math.round(newX);
        this.y = Math.round(newY);
    }

    @Override
    public void translate(double dx, double dy) {
        this.x += dx * 0.8;
        this.y += dy * 0.8;
    }

    @Override
    public void rotate(double degree) {
        double next = this.rotation + degree;
        this.rotation = Math.round(next / 30.0) * 30.0;
        this.rotation %= 360;
        if (this.rotation < 0) {
            this.rotation += 360;
        }
    }

    @Override
    public double getArea() {
        return (base * height) / 2.0;
    }

    @Override
    public String getInfo() {
        return String.format(
                "InterTriangle [x=%.2f, y=%.2f, base=%.2f, height=%.2f, rotation=%.2f, area=%.2f]",
                x,
                y,
                base,
                height,
                rotation,
                getArea());
    }
}
