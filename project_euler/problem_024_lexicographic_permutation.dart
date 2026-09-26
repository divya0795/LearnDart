// Problem 24: the millionth lexicographic permutation of 0123456789.
// Instead of generating them all, use factorials: the first digit is
// chosen by dividing the (0-based) index by 9!, and so on with the
// remainder.
String nthPermutation(String digits, int n) {
  final pool = digits.split('');
  var k = n - 1;
  final fact = [1];
  for (var i = 1; i <= pool.length; i++) {
    fact.add(fact.last * i);
  }
  final out = StringBuffer();
  for (var i = pool.length; i >= 1; i--) {
    final idx = k ~/ fact[i - 1];
    k %= fact[i - 1];
    out.write(pool.removeAt(idx));
  }
  return out.toString();
}

void main() {
  print([for (var i = 1; i <= 6; i++) nthPermutation('012', i)]);
  print(nthPermutation('0123456789', 1000000));
}
