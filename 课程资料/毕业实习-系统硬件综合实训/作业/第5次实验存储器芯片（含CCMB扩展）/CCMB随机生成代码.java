
public class Main {

    public static void main(String[] args) {

        char[] C = {'1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B'};
        char[] M = {'1', '2', '3', '4', '5', '6'};
        char[] B = {'1', '2', '3', '4'};
        System.out.println("C\tC\tM\tB");
        for (int i = 0; i < 110; i++) {
            int c1 = (int) (11 * Math.random());
            int c2 = (int) (11 * Math.random());
            while (c1 == c2) {
                c2 = (int) (11 * Math.random());
            }
            int m = (int) (6 * Math.random());
            int b = (int) (4 * Math.random());
            System.out.println(C[c1]+"\t"+C[c2]+"\t"+M[m]+"\t"+B[b]);
        }

    }
}