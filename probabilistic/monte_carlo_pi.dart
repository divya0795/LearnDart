// Monte Carlo estimate of pi: throw random points into the unit square;
// the fraction landing inside the quarter circle of radius 1 approaches
// pi/4. The error shrinks like 1/sqrt(n), so every extra digit costs 100x
// more samples.
import 'dart:math';

double estimatePi(int samples, {int seed = 3}) {
  final r = Random(seed);
  var inside = 0;
  for (var i = 0; i < samples; i++) {
    final x = r.nextDouble(), y = r.nextDouble();
    if (x * x + y * y <= 1) inside++;
  }
  return 4 * inside / samples;
}
