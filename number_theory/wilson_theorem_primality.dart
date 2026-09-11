// Wilson's theorem: n > 1 is prime exactly when (n-1)! is congruent to
// -1 (mod n). It is a beautiful characterisation but far too slow to be
// practical because it needs n multiplications.
bool isPrimeWilson(int n) {
  if (n < 2) return false;
  var f = 1;
  for (var i = 2; i < n; i++) {
    f = f * i % n;
  }
  return f == n - 1;
}
