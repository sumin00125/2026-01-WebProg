public class Rectangle extends Shape {
    private double width;
    private double height;

    public Rectangle() {
        super();
        this.width = randomInRange(1, 50);
        this.height = randomInRange(1, 50);
    }

    public Rectangle(double x, double y, double width, double height) {
        super(x, y);
        this.width = width;
        this.height = height;
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
                "Rectangle [x=%.2f, y=%.2f, width=%.2f, height=%.2f, rotation=%.2f, area=%.2f]",
                x,
                y,
                width,
                height,
                rotation,
                getArea());
    }
}
