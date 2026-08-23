// Is n a perfect square? Compute the integer square root and square it
// back -- no floating-point error for large n.
int isqrt(int n) {
  if (n < 2) return n;
  var x = n, y = (x + 1) ~/ 2;
  while (y < x) {
    x = y;
    y = (x + n ~/ x) ~/ 2;
  }
  return x;
}

bool isPerfectSquare(int n) {
  if (n < 0) return false;
  final r = isqrt(n);
  return r * r == n;
}
