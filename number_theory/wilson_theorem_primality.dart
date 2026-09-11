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

bool isPrimeTrial(int n) {
  if (n < 2) return false;
  for (var i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  final a = [
    for (var n = 0; n < 60; n++)
      if (isPrimeWilson(n)) n,
  ];
  final b = [
    for (var n = 0; n < 60; n++)
      if (isPrimeTrial(n)) n,
  ];
  print(a);
  print('agree: ${a.toString() == b.toString()}');
}
