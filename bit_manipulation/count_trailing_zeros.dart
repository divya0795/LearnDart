// Count trailing zeros in the binary form of a positive integer.
//
// n & -n isolates the lowest set bit (a power of two); the trailing zero
// count is that bit's position. A plain loop shifting right works too.

int trailingZerosLoop(int n) {
  if (n == 0) return 64;
  var c = 0;
  while (n & 1 == 0) {
    n >>= 1;
    c++;
  }
  return c;
}

int trailingZeros(int n) {
  if (n == 0) return 64;
  return (n & -n).bitLength - 1;
}

void main() {
  for (final n in [1, 2, 8, 12, 40, 96, 1024]) {
    print(
      '${n.toRadixString(2).padLeft(11)}  loop=${trailingZerosLoop(n)} fast=${trailingZeros(n)}',
    );
  }
}
