// Prime factorisation by trial division: divide out each factor as many
// times as it fits. Only factors up to sqrt(n) need testing; whatever is
// left above 1 at the end is itself prime.
//
// Complexity: O(sqrt n).
Map<int, int> primeFactors(int n) {
  final f = <int, int>{};
  for (var p = 2; p * p <= n; p++) {
    while (n % p == 0) {
      f[p] = (f[p] ?? 0) + 1;
      n ~/= p;
    }
  }
  if (n > 1) f[n] = (f[n] ?? 0) + 1;
  return f;
}
