// Prime counting function pi(n): how many primes are <= n. A boolean sieve
// marks composites; prefix counts then answer pi(x) for any x <= n.
List<bool> sieve(int n) {
  final p = List.filled(n + 1, true)..[0] = false;
  if (n >= 1) p[1] = false;
  for (var i = 2; i * i <= n; i++) {
    if (p[i]) {
      for (var j = i * i; j <= n; j += i) {
        p[j] = false;
      }
    }
  }
  return p;
}

List<int> primeCounts(int n) {
  final s = sieve(n);
  var c = 0;
  return [for (var i = 0; i <= n; i++) c += s[i] ? 1 : 0];
}

void main() {
  final pi = primeCounts(100000);
  for (final n in [10, 100, 1000, 10000, 100000]) {
    final est = n / (n == 1 ? 1 : _ln(n));
    print('pi($n) = ${pi[n]}  (n/ln n ~ ${est.round()})');
  }
}

double _ln(int n) {
  var x = n.toDouble(), r = 0.0;
  while (x > 2) {
    x /= 2.718281828459045;
    r += 1;
  }
  var y = (x - 1) / (x + 1), term = y, sum = 0.0;
  for (var k = 1; k < 40; k += 2) {
    sum += term / k;
    term *= y * y;
  }
  return r + 2 * sum;
}
