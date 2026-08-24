// Bisection method: if f is continuous and f(a), f(b) have opposite
// signs, a root lies between them. Halve the interval, keeping the half
// where the sign changes. Slow (one bit per step) but guaranteed.
double bisect(
  double Function(double) f,
  double a,
  double b, {
  double tol = 1e-10,
  int maxIter = 200,
}) {
  var fa = f(a);
  if (fa * f(b) > 0) throw ArgumentError('f(a) and f(b) must differ in sign');
  for (var i = 0; i < maxIter && (b - a) / 2 > tol; i++) {
    final m = (a + b) / 2, fm = f(m);
    if (fm == 0) return m;
    if (fa * fm < 0) {
      b = m;
    } else {
      a = m;
      fa = fm;
    }
  }
  return (a + b) / 2;
}
