// GCD and LCM of a whole list by folding the two-number versions.
// lcm(a, b) = a / gcd(a, b) * b (divide first to avoid overflow).
int gcd(int a, int b) => b == 0 ? a.abs() : gcd(b, a % b);

int lcm(int a, int b) => a == 0 || b == 0 ? 0 : a ~/ gcd(a, b) * b;

int gcdAll(List<int> xs) => xs.reduce(gcd);

int lcmAll(List<int> xs) => xs.reduce(lcm);

(int, int) simplify(int num, int den) {
  final g = gcd(num, den);
  return (num ~/ g, den ~/ g);
}

void main() {
  print('gcd [48, 180, 36] = ${gcdAll([48, 180, 36])}');
  print('lcm [4, 6, 10] = ${lcmAll([4, 6, 10])}');
  print('1..10 lcm = ${lcmAll(List.generate(10, (i) => i + 1))}');
  print('18/48 = ${simplify(18, 48)}');
}
