// Secant method: like Newton's method but replaces the derivative with
// the slope of the line through the last two points. No derivative
// needed, and it converges faster than bisection (order ~1.62).
double secant(
  double Function(double) f,
  double x0,
  double x1, {
  double tol = 1e-12,
  int maxIter = 50,
}) {
  for (var i = 0; i < maxIter; i++) {
    final f0 = f(x0), f1 = f(x1);
    if ((f1 - f0).abs() < 1e-300) break;
    final x2 = x1 - f1 * (x1 - x0) / (f1 - f0);
    if ((x2 - x1).abs() < tol) return x2;
    x0 = x1;
    x1 = x2;
  }
  return x1;
}

void main() {
  print(secant((x) => x * x - 2, 1, 2));
  print(secant((x) => x * x * x - x - 2, 1, 2));
}
