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

void main() {
  final s = sigmaSieve(30);
  for (final n in [6, 12, 15, 28]) {
    print('$n is ${classify(n, s)} (sigma=${s[n]})');
  }
  print(
    'perfect numbers <= 500: ${[for (var n = 2; n <= 500; n++)
      if (classify(n, sigmaSieve(500)) == 'perfect') n]}',
  );
}
