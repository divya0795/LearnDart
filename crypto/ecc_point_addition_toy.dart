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

Pt add(Pt x, Pt y) {
  if (x == null) return y;
  if (y == null) return x;
  if (x.$1 == y.$1 && (x.$2 + y.$2) % p == 0) return null;
  final s = x == y
      ? (3 * x.$1 * x.$1 + a) * _inv(2 * x.$2) % p
      : (y.$2 - x.$2) * _inv(y.$1 - x.$1) % p;
  final rx = ((s * s - x.$1 - y.$1) % p + p) % p;
  final ry = ((s * (x.$1 - rx) - x.$2) % p + p) % p;
  return (rx, ry);
}

Pt mul(int k, Pt q) {
  Pt result;
  result = null;
  var addend = q;
  while (k > 0) {
    if (k.isOdd) result = add(result, addend);
    addend = add(addend, addend);
    k >>= 1;
  }
  return result;
}

void main() {
  final g = (3, 6);
  print('G on curve: ${onCurve(g)}');
  for (var k = 1; k <= 5; k++) {
    final q = mul(k, g);
    print('$k*G = $q on curve: ${onCurve(q)}');
  }
}
