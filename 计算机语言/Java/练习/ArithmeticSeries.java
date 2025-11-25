import java.util.Scanner;

class ArithmeticSeries {
    public static void main (String[] args) {
        // a + b - a - i
        // for (int i = 0;  i < b - a; i++) {
        //     a += a + i;
        // }
        // return a + b;
    }
    public int sum (int a, int b) {
        for(int i = 0; i < b - a; i++) {
            a += a + i;
        }
        return a + b;
    }
}