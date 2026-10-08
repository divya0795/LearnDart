// Fast doubling computes Fibonacci in O(log n) using
//   F(2k)   = F(k) * (2*F(k+1) - F(k))
//   F(2k+1) = F(k)^2 + F(k+1)^2
// It returns the pair (F(k), F(k+1)) and recurses on k ~/ 2.
(BigInt, BigInt) _fib(int n) {
  if (n == 0) return (BigInt.zero, BigInt.one);
  final (a, b) = _fib(n >> 1);
  final c = a * (BigInt.two * b - a);
  final d = a * a + b * b;
  return n.isEven ? (c, d) : (d, c + d);
}

BigInt fib(int n) => _fib(n).$1;

void main() {
  print([for (var i = 0; i < 15; i++) fib(i)]);
  print('fib(100) = ${fib(100)}');
  print('fib(10000) has ${fib(10000).toString().length} digits');
}
