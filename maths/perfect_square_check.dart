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

List<int> squaresBetween(int lo, int hi) {
  final out = <int>[];
  for (
    var r = isqrt(lo > 0 ? lo - 1 : 0) + (lo > 0 ? 1 : 0);
    r * r <= hi;
    r++
  ) {
    if (r * r >= lo) out.add(r * r);
  }
  return out;
}

void main() {
  for (final n in [0, 1, 2, 16, 99, 100, 1 << 40]) {
    print('$n -> ${isPerfectSquare(n)}');
  }
  print(squaresBetween(10, 100));
}
