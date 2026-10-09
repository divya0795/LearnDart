// Round an integer up to the next power of two.
//
// Subtract 1, then "smear" the highest set bit into every lower position
// with OR-shifts so the value becomes 2^k - 1, and add 1.

int nextPowerOfTwo(int n) {
  if (n <= 1) return 1;
  n--;
  n |= n >> 1;
  n |= n >> 2;
  n |= n >> 4;
  n |= n >> 8;
  n |= n >> 16;
  n |= n >> 32;
  return n + 1;
}

int nextPowerOfTwoFast(int n) => n <= 1 ? 1 : 1 << (n - 1).bitLength;

void main() {
  for (final n in [0, 1, 5, 16, 17, 1000, 1025]) {
    print('$n -> ${nextPowerOfTwo(n)} / ${nextPowerOfTwoFast(n)}');
  }
}
