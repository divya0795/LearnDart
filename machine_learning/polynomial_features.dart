// Polynomial feature expansion lets a linear model fit curves: turn x
// into [x, x^2, ..., x^d]. Combined with linear regression this fits a
// polynomial.
List<double> expand(double x, int degree) {
  final out = <double>[];
  var p = 1.0;
  for (var i = 1; i <= degree; i++) {
    p *= x;
    out.add(p);
  }
  return out;
}

double horner(List<double> coeffs, double x) {
  var r = 0.0;
  for (final c in coeffs.reversed) {
    r = r * x + c;
  }
  return r;
}

void main() {
  print(expand(3, 4));
  final c = [1.0, -2.0, 3.0]; // 1 - 2x + 3x^2
  for (final x in [0.0, 1.0, 2.0]) {
    print('p($x) = ${horner(c, x)}');
  }
}
