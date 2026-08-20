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
