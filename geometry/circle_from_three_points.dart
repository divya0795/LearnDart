// Circle through three points (the circumcircle of a triangle).
//
// The centre is where the perpendicular bisectors of two sides meet.
// Solving that pair of linear equations gives the closed form below; if
// the points are collinear the determinant d is zero and no circle exists.
import 'dart:math' as math;

({double x, double y, double r})? circumcircle(
  (double, double) a,
  (double, double) b,
  (double, double) c,
) {
  final d =
      2 * (a.$1 * (b.$2 - c.$2) + b.$1 * (c.$2 - a.$2) + c.$1 * (a.$2 - b.$2));
  if (d == 0) return null;
  final a2 = a.$1 * a.$1 + a.$2 * a.$2;
  final b2 = b.$1 * b.$1 + b.$2 * b.$2;
  final c2 = c.$1 * c.$1 + c.$2 * c.$2;
  final ux = (a2 * (b.$2 - c.$2) + b2 * (c.$2 - a.$2) + c2 * (a.$2 - b.$2)) / d;
  final uy = (a2 * (c.$1 - b.$1) + b2 * (a.$1 - c.$1) + c2 * (b.$1 - a.$1)) / d;
  final r = math.sqrt(math.pow(a.$1 - ux, 2) + math.pow(a.$2 - uy, 2));
  return (x: ux, y: uy, r: r);
}
