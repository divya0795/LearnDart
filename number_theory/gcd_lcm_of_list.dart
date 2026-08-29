// GCD and LCM of a whole list by folding the two-number versions.
// lcm(a, b) = a / gcd(a, b) * b (divide first to avoid overflow).
int gcd(int a, int b) => b == 0 ? a.abs() : gcd(b, a % b);

int lcm(int a, int b) => a == 0 || b == 0 ? 0 : a ~/ gcd(a, b) * b;
