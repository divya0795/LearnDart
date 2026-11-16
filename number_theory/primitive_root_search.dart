// Find a primitive root modulo a prime p: a number g whose powers
// generate every non-zero residue. g is a primitive root exactly when
// g^((p-1)/q) != 1 for every prime factor q of p-1.
int _pow(int b, int e, int m) {
  var r = 1;
  b %= m;
  while (e > 0) {
    if (e.isOdd) r = r * b % m;
    b = b * b % m;
    e >>= 1;
  }
  return r;
}

List<int> _primeFactors(int n) {
  final f = <int>[];
  for (var p = 2; p * p <= n; p++) {
    if (n % p == 0) {
      f.add(p);
      while (n % p == 0) {
        n ~/= p;
      }
    }
  }
  if (n > 1) f.add(n);
  return f;
}

int primitiveRoot(int p) {
  final qs = _primeFactors(p - 1);
  for (var g = 2; g < p; g++) {
    if (qs.every((q) => _pow(g, (p - 1) ~/ q, p) != 1)) return g;
  }
  return 1;
}

void main() {
  for (final p in [7, 11, 23, 101]) {
    final g = primitiveRoot(p);
    final seen = {for (var k = 0; k < p - 1; k++) _pow(g, k, p)};
    print('p=$p g=$g covers ${seen.length} of ${p - 1} residues');
  }
}
