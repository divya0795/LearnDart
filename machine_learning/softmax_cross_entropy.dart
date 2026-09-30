// Softmax converts raw scores (logits) into probabilities that sum to 1.
// Subtract the maximum first so exp() cannot overflow.
import 'dart:math';

List<double> softmax(List<double> z) {
  final m = z.reduce(max);
  final e = [for (final x in z) exp(x - m)];
  final s = e.fold(0.0, (a, b) => a + b);
  return [for (final x in e) x / s];
}

double crossEntropy(List<double> probs, int trueClass) =>
    -log(probs[trueClass] + 1e-12);

void main() {
  final p = softmax([2.0, 1.0, 0.1]);
  print(p.map((x) => x.toStringAsFixed(3)).toList());
  print('sum = ${p.fold(0.0, (a, b) => a + b)}');
  print('loss (true=0): ${crossEntropy(p, 0).toStringAsFixed(3)}');
  print('loss (true=2): ${crossEntropy(p, 2).toStringAsFixed(3)}');
  print(softmax([1000, 1001, 1002]).map((x) => x.toStringAsFixed(3)).toList());
}
