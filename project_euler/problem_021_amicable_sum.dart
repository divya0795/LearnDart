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

void main() {
  final d = properDivisorSums(10000);
  var sum = 0;
  for (var a = 2; a < 10000; a++) {
    final b = d[a];
    if (b != a && b < 10001 && d[b] == a) sum += a;
  }
  print('220/284 check: ${d[220]} ${d[284]}');
  print('answer: $sum');
}
