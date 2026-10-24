// Elliptic curve arithmetic over a small prime field, y^2 = x^3 + ax + b
// (mod p). The curve is tiny for readability -- real ECC uses 256-bit
// fields. Points form a group under "point addition".
const p = 97, a = 2, b = 3;

typedef Pt = (int, int)?; // null is the point at infinity

int _inv(int x) {
  var r = 1, e = p - 2, base = x % p;
  while (e > 0) {
    if (e.isOdd) r = r * base % p;
    base = base * base % p;
    e >>= 1;
  }
  return r;
}

bool onCurve(Pt q) =>
    q == null || (q.$2 * q.$2 - (q.$1 * q.$1 * q.$1 + a * q.$1 + b)) % p == 0;
