
class Exp {

    int exponent(int a, int power) {
        int result = 1;

        while (power != 0) {
            if (isEven(power)) {
                power /= 2;
                a *= a;
            } else {
                result *= a;
                power -= 1;
            }
        }
        return result;
    }

    boolean isEven(int power) {
        return power % 2 == 0;
    }
}
