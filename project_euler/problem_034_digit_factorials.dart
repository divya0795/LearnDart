// Problem 34: find numbers equal to the sum of the factorials of their
// digits (e.g. 145 = 1! + 4! + 5!). 7 * 9! = 2540160 bounds the search.
final _fact = [for (var i = 0, f = 1; i < 10; i++, f *= (i == 0 ? 1 : i)) f];

List<int> digitFactorialNumbers(int limit) {
  final fact = List.filled(10, 1);
  for (var i = 1; i < 10; i++) {
    fact[i] = fact[i - 1] * i;
  }
  return [
    for (var n = 10; n <= limit; n++)
      if (n.toString().split('').fold(0, (a, d) => a + fact[int.parse(d)]) == n)
        n,
  ];
}
