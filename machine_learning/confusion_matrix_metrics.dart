// Binary classification metrics from a confusion matrix: true/false
// positives and negatives. Accuracy alone is misleading on imbalanced
// data, so also report precision, recall and F1.
class Confusion {
  int tp = 0, fp = 0, tn = 0, fn = 0;

  Confusion(List<int> actual, List<int> predicted) {
    for (var i = 0; i < actual.length; i++) {
      if (actual[i] == 1) {
        predicted[i] == 1 ? tp++ : fn++;
      } else {
        predicted[i] == 1 ? fp++ : tn++;
      }
    }
  }
}

extension Metrics on Confusion {
  double get accuracy => (tp + tn) / (tp + tn + fp + fn);
  double get precision => tp + fp == 0 ? 0 : tp / (tp + fp);
  double get recall => tp + fn == 0 ? 0 : tp / (tp + fn);
  double get f1 => precision + recall == 0
      ? 0
      : 2 * precision * recall / (precision + recall);
}

void main() {
  final actual = [1, 0, 0, 0, 0, 0, 0, 0, 0, 1];
  final lazy = List.filled(10, 0);
  final c = Confusion(actual, lazy);
  print('always-0: accuracy ${c.accuracy}, recall ${c.recall}, f1 ${c.f1}');
  final better = Confusion(actual, [1, 0, 0, 1, 0, 0, 0, 0, 0, 1]);
  print(
    'better: precision ${better.precision.toStringAsFixed(2)}, recall ${better.recall}, f1 ${better.f1.toStringAsFixed(2)}',
  );
}
