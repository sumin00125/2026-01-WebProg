public class Triangle extends Shape {
    private double base;
    private double height;

    public Triangle() {
        super();
        this.base = randomInRange(1, 40);
        this.height = randomInRange(1, 40);
    }

    public Triangle(double x, double y, double base, double height) {
        super(x, y);
        this.base = base;
        this.height = height;
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
                "Triangle [x=%.2f, y=%.2f, base=%.2f, height=%.2f, rotation=%.2f, area=%.2f]",
                x,
                y,
                base,
                height,
                rotation,
                getArea());
    }
}
