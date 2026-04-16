public class InterfaceDemo {
    public static void main(String[] args) {
    InterShapeCounter counter = new InterShapeCounter();

        InterShape[] shapes = {
        new InterRectangle(counter),
        new InterTriangle(counter),
        new InterCircle(counter),
        new InterRectangle(counter, 10, 20, 8, 5),
        new InterTriangle(counter, 30, 15, 12, 7),
        new InterCircle(counter, 50, 40, 6)
        };

        for (InterShape shape : shapes) {
            shape.move(10, 10);
            shape.translate(3, -2);
            shape.rotate(45);
            System.out.println(shape.getInfo());
        }

        System.out.println("Total interface shapes created: " + counter.getTotalShapeCount());
    }
}
