import java.util.Random;

public abstract class Shape {
    private static final Random RANDOM = new Random();
    private static int totalShapeCount = 0;

    protected double x;
    protected double y;
    protected double rotation;

    protected Shape() {
        this.x = randomInRange(0, 100);
        this.y = randomInRange(0, 100);
        this.rotation = randomInRange(0, 360);
        totalShapeCount++;
    }

    protected Shape(double x, double y) {
        this.x = x;
        this.y = y;
        this.rotation = 0;
        totalShapeCount++;
    }

    protected static double randomInRange(double min, double max) {
        return min + (max - min) * RANDOM.nextDouble();
    }

    public static int getTotalShapeCount() {
        return totalShapeCount;
    }

    public abstract void move(double newX, double newY);

    public abstract void translate(double dx, double dy);

    public abstract void rotate(double degree);

    public abstract double getArea();

    public abstract String getInfo();
}
