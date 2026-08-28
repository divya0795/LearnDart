// Simpson's rule: approximate the definite integral of f over [a, b] by
// fitting a parabola through every three consecutive sample points.
//
// With an even number of intervals n and step h = (b-a)/n:
//   integral ~ h/3 * (f0 + 4*f1 + 2*f2 + 4*f3 + ... + 4*f(n-1) + fn)
// The error shrinks like h^4, so it is far more accurate than the
// trapezoid rule (h^2) for smooth functions, and exact for cubics.
import 'dart:math' as math;

double simpson(double Function(double) f, double a, double b, [int n = 100]) {
  if (n.isOdd) n++;
  final h = (b - a) / n;
  var sum = f(a) + f(b);
  for (var i = 1; i < n; i++) {
    sum += f(a + i * h) * (i.isOdd ? 4 : 2);
  }
  return sum * h / 3;
}

double trapezoid(double Function(double) f, double a, double b, int n) {
  final h = (b - a) / n;
  var sum = (f(a) + f(b)) / 2;
  for (var i = 1; i < n; i++) {
    sum += f(a + i * h);
  }
  return sum * h;
}

void main() {
  print('x^3 on [0,2]   simpson=${simpson((x) => x * x * x, 0, 2)} (exact 4)');
  final s = simpson(math.sin, 0, math.pi, 10);
  final t = trapezoid(math.sin, 0, math.pi, 10);
  print(
    'sin on [0,pi], n=10: simpson error=${(s - 2).abs()}, trapezoid error=${(t - 2).abs()}',
  );
}
