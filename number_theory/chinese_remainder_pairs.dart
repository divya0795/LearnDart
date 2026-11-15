// Solve x = a1 (mod m1) and x = a2 (mod m2) for coprime moduli by
// searching x = a1 + m1 * t until it satisfies the second congruence.
// Fine for small moduli; the extended Euclid version scales better.
int? solvePair(int a1, int m1, int a2, int m2) {
  for (var t = 0; t < m2; t++) {
    final x = a1 + m1 * t;
    if (x % m2 == a2 % m2) return x;
  }
  return null;
}

(int, int)? solveSystem(List<(int, int)> congruences) {
  var (a, m) = congruences.first;
  for (final (a2, m2) in congruences.skip(1)) {
    final x = solvePair(a, m, a2, m2);
    if (x == null) return null;
    a = x;
    m *= m2;
    a %= m;
  }
  return (a, m);
}
