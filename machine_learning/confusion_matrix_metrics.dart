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
