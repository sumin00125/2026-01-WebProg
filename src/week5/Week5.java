import java.util.Scanner;

public class Week5 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("숫자를 입력하세요: ");
        int limit = scanner.nextInt();

        for (int number = 2; number <= 9; number++) {
            System.out.println(number + "의 배수:");
            for (int multiple = number; multiple < limit; multiple += number) {
                System.out.println(multiple);
            }
            System.out.println();
        }

        scanner.close();
    }
}