// Euler's criterion: for an odd prime p and a not divisible by p,
// a^((p-1)/2) mod p is 1 if a is a square mod p and p-1 (i.e. -1) if not.
int powMod(int b, int e, int m) {
  var r = 1;
  b %= m;
  while (e > 0) {
    if (e.isOdd) r = r * b % m;
    b = b * b % m;
    e >>= 1;
  }
  return r;
}
