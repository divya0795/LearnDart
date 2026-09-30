// Softmax converts raw scores (logits) into probabilities that sum to 1.
// Subtract the maximum first so exp() cannot overflow.
import 'dart:math';

List<double> softmax(List<double> z) {
  final m = z.reduce(max);
  final e = [for (final x in z) exp(x - m)];
  final s = e.fold(0.0, (a, b) => a + b);
  return [for (final x in e) x / s];
}
