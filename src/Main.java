public class Main {
    public static void main(String[] args) {
        // 1) 기본 변수 생성
        int age = 20;
        double height = 175.5;
        boolean isStudent = true;
        char grade = 'A';

        System.out.println("=== 변수 ===");
        System.out.println("age = " + age);
        System.out.println("height = " + height);
        System.out.println("isStudent = " + isStudent);
        System.out.println("grade = " + grade);

        // 2) 배열 생성
        int[] numbers = {10, 20, 30, 40, 50};
        String[] names = new String[3];
        names[0] = "Alice";
        names[1] = "Bob";
        names[2] = "Charlie";

        System.out.println();
        System.out.println("=== 배열 ===");
        for (int i = 0; i < numbers.length; i++) {
            System.out.println("numbers[" + i + "] = " + numbers[i]);
        }

        for (String name : names) {
            System.out.println("name = " + name);
        }

        // 3) 문자열 생성
        String text1 = "Hello Java";
        String text2 = new String("Hello Java");
        String text3 = "Java" + " Study";

        System.out.println();
        System.out.println("=== 문자열 ===");
        System.out.println("text1 = " + text1);
        System.out.println("text2 = " + text2);
        System.out.println("text3 = " + text3);

        // 문자열 길이와 일부 기능
        System.out.println("text1 length = " + text1.length());
        System.out.println("text1 contains 'Java' = " + text1.contains("Java"));
    }
}