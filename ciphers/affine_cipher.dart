// Affine cipher: E(x) = (a*x + b) mod 26 on letter positions 0..25.
//
// For decryption to exist, a must be coprime to 26 so it has a modular
// inverse a^-1; then D(y) = a^-1 * (y - b) mod 26. Caesar is the special
// case a = 1.

int modInverse(int a, int m) {
  for (var x = 1; x < m; x++) {
    if (a * x % m == 1) return x;
  }
  throw ArgumentError('$a has no inverse mod $m');
}
