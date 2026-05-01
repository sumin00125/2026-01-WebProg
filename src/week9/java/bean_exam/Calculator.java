package bean_exam;

public class Calculator {
    private double n1;
    private double n2;
    private String op;

    public double calc() {
        if (op == null) {
            throw new IllegalArgumentException("연산자가 지정되지 않았습니다.");
        }

        switch (op) {
            case "+":
                return n1 + n2;
            case "-":
                return n1 - n2;
            case "*":
                return n1 * n2;
            case "/":
                if (n2 == 0) {
                    throw new ArithmeticException("0으로 나눌 수 없습니다.");
                }
                return n1 / n2;
            default:
                throw new IllegalArgumentException("지원하지 않는 연산자입니다: " + op);
        }
    }

    public double getN1() {
        return n1;
    }

    public void setN1(double n1) {
        this.n1 = n1;
    }

    public double getN2() {
        return n2;
    }

    public void setN2(double n2) {
        this.n2 = n2;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }
}
