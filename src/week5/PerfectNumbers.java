public class PerfectNumbers {
    public static void main(String[] args) {
        System.out.println("2000 이하의 완전수:");
        for (int i = 1; i <= 2000; i++) {
            if (isPerfect(i)) {
                System.out.println(i);
            }
        }
    }

    public static boolean isPerfect(int n) {
        if (n <= 1) return false;
        int sum = 1; // 1은 항상 약수
        for (int i = 2; i * i <= n; i++) {
            if (n % i == 0) {
                sum += i;
                if (i != n / i) {
                    sum += n / i;
                }
            }
        }
        return sum == n;
    }
}