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

String _map(String s, int Function(int) f) {
  return String.fromCharCodes(
    s.codeUnits.map((u) {
      if (u >= 97 && u <= 122) return 97 + f(u - 97);
      if (u >= 65 && u <= 90) return 65 + f(u - 65);
      return u;
    }),
  );
}

String encrypt(String s, int a, int b) => _map(s, (x) => (a * x + b) % 26);

String decrypt(String s, int a, int b) {
  final inv = modInverse(a, 26);
  return _map(s, (y) => (inv * (y - b) % 26 + 26) % 26);
}
