import java.util.Random;

public class InterRectangle implements InterShape {
    private static final Random RANDOM = new Random();

    private InterShapeCounter counter;
    private double x;
    private double y;
    private double width;
    private double height;
    private double rotation;

    public InterRectangle(InterShapeCounter counter) {
        this.counter = counter;
        this.x = randomInRange(0, 100);
        this.y = randomInRange(0, 100);
        this.width = randomInRange(1, 50);
        this.height = randomInRange(1, 50);
        this.rotation = randomInRange(0, 360);
        this.counter.increaseCount();
    }

    public InterRectangle(InterShapeCounter counter, double x, double y, double width, double height) {
        this.counter = counter;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
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
        this.rotation = (this.rotation + degree) % 360;
        if (this.rotation < 0) {
            this.rotation += 360;
        }
    }

    @Override
    public double getArea() {
        return width * height;
    }

    @Override
    public String getInfo() {
        return String.format(
                "InterRectangle [x=%.2f, y=%.2f, width=%.2f, height=%.2f, rotation=%.2f, area=%.2f]",
                x,
                y,
                width,
                height,
                rotation,
                getArea());
    }
}
