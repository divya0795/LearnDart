// Problem 30: find numbers that equal the sum of the fifth powers of their
// digits. An upper bound exists: 6 * 9^5 = 354294, since a 7-digit number
// cannot reach the sum of its digits' fifth powers.
int _powSum(int n, int p) {
  var s = 0;
  while (n > 0) {
    var d = n % 10, v = 1;
    for (var i = 0; i < p; i++) {
      v *= d;
    }
    s += v;
    n ~/= 10;
  }
  return s;
}

List<int> digitPowerNumbers(int power, int limit) => [
  for (var n = 10; n <= limit; n++)
    if (_powSum(n, power) == n) n,
];
