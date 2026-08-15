// Shamir's secret sharing: split a secret into n shares so that any k of
// them reconstruct it, but k-1 reveal nothing.
//
// Pick a random polynomial of degree k-1 over a prime field whose constant
// term is the secret; share i is the point (i, f(i)). Any k points
// determine the polynomial, and Lagrange interpolation at x=0 recovers
// the secret. Arithmetic is mod p = 2^31-1 so products fit in 64 bits.
import 'dart:math';

const p = 2147483647;

int _pow(int b, int e) {
  var r = 1;
  b %= p;
  while (e > 0) {
    if (e & 1 == 1) r = r * b % p;
    b = b * b % p;
    e >>= 1;
  }
  return r;
}

int _inv(int a) => _pow(a, p - 2); // Fermat's little theorem

List<(int, int)> split(int secret, int n, int k, [Random? rng]) {
  rng ??= Random.secure();
  final coef = [secret, for (var i = 1; i < k; i++) rng.nextInt(p)];
  int f(int x) => coef.reversed.fold(0, (acc, c) => (acc * x + c) % p);
  return [for (var x = 1; x <= n; x++) (x, f(x))];
}

int combine(List<(int, int)> shares) {
  var secret = 0;
  for (final (xi, yi) in shares) {
    var num = 1, den = 1;
    for (final (xj, _) in shares) {
      if (xj == xi) continue;
      num = num * (p - xj) % p;
      den = den * ((xi - xj) % p) % p;
    }
    secret = (secret + yi * num % p * _inv(den)) % p;
  }
  return secret;
}

void main() {
  final shares = split(123456789, 5, 3);
  print('shares: $shares');
  print('3 shares -> ${combine(shares.sublist(0, 3))}');
  print('other 3  -> ${combine([shares[4], shares[1], shares[2]])}');
  print('2 shares -> ${combine(shares.sublist(0, 2))} (wrong, as expected)');
}
