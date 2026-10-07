// Problem 23: a number is abundant if its proper divisors sum to more
// than itself. Every integer above 28123 is a sum of two abundant
// numbers; find the sum of all positive integers that are NOT.
List<int> abundantNumbers(int limit) {
  final s = List.filled(limit + 1, 0);
  for (var i = 1; i <= limit ~/ 2; i++) {
    for (var j = 2 * i; j <= limit; j += i) {
      s[j] += i;
    }
  }
  return [
    for (var n = 12; n <= limit; n++)
      if (s[n] > n) n,
  ];
}

int sumNonAbundantSums(int limit) {
  final abundant = abundantNumbers(limit);
  final can = List.filled(limit + 1, false);
  for (var i = 0; i < abundant.length; i++) {
    for (var j = i; j < abundant.length; j++) {
      final s = abundant[i] + abundant[j];
      if (s > limit) break;
      can[s] = true;
    }
  }
  var total = 0;
  for (var n = 1; n <= limit; n++) {
    if (!can[n]) total += n;
  }
  return total;
}

void main() {
  print('first abundant: ${abundantNumbers(100).take(5).toList()}');
  print('answer: ${sumNonAbundantSums(28123)}');
}
