// Divisor-sum function sigma(n) for every n up to a limit using a
// sieve: add each i to all of its multiples. O(n log n).
List<int> sigmaSieve(int limit) {
  final s = List.filled(limit + 1, 0);
  for (var i = 1; i <= limit; i++) {
    for (var j = i; j <= limit; j += i) {
      s[j] += i;
    }
  }
  return s;
}

String classify(int n, List<int> sigma) {
  final aliquot = sigma[n] - n;
  if (aliquot == n) return 'perfect';
  return aliquot > n ? 'abundant' : 'deficient';
}
