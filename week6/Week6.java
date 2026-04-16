public class Week6 {
    public static void main(String[] args) {
        Shape[] shapes = {
                new Rectangle(),
                new Triangle(),
                new Circle(),
                new Rectangle(10, 20, 8, 5),
                new Triangle(30, 15, 12, 7),
                new Circle(50, 40, 6)
        };

        for (Shape shape : shapes) {
            shape.move(10, 10);
            shape.translate(3, -2);
            shape.rotate(45);
            System.out.println(shape.getInfo());
        }

        System.out.println("Total shapes created: " + Shape.getTotalShapeCount());
    }
}
