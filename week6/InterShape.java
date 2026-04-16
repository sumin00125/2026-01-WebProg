public interface InterShape {
    void move(double newX, double newY);

    void translate(double dx, double dy);

    void rotate(double degree);

    double getArea();

    String getInfo();
}
