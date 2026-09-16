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
