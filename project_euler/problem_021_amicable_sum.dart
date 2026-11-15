// Problem 21: d(n) is the sum of proper divisors of n. If d(a) = b and
// d(b) = a with a != b, both are amicable. Sum all amicable numbers under
// 10000. A divisor-sum sieve computes every d(n) at once.
List<int> properDivisorSums(int limit) {
  final d = List.filled(limit + 1, 0);
  for (var i = 1; i <= limit ~/ 2; i++) {
    for (var j = 2 * i; j <= limit; j += i) {
      d[j] += i;
    }
  }
  return d;
}
