// Pythagorean triples from Euclid's formula: for m > n > 0,
// (m^2 - n^2, 2mn, m^2 + n^2). When m and n are coprime with opposite
// parity the triple is primitive; every triple is a multiple of one.
int _gcd(int a, int b) => b == 0 ? a : _gcd(b, a % b);

List<(int, int, int)> primitiveTriples(int maxC) {
  final out = <(int, int, int)>[];
  for (var m = 2; m * m + 1 <= maxC; m++) {
    for (var n = 1; n < m; n++) {
      if ((m - n).isOdd && _gcd(m, n) == 1) {
        final c = m * m + n * n;
        if (c <= maxC) {
          final a = m * m - n * n, b = 2 * m * n;
          out.add(a < b ? (a, b, c) : (b, a, c));
        }
      }
    }
  }
  return out..sort((x, y) => x.$3.compareTo(y.$3));
}
