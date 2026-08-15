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
