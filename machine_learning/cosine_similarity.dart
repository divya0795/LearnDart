// Cosine similarity measures the angle between two vectors:
// dot(a, b) / (|a| * |b|). It ignores magnitude, so documents of different
// lengths with the same word proportions look identical. Range [-1, 1].
import 'dart:math';

double dot(List<double> a, List<double> b) {
  var s = 0.0;
  for (var i = 0; i < a.length; i++) {
    s += a[i] * b[i];
  }
  return s;
}

double norm(List<double> a) => sqrt(dot(a, a));

double cosine(List<double> a, List<double> b) =>
    dot(a, b) / (norm(a) * norm(b));

List<(int, double)> rank(List<double> query, List<List<double>> docs) {
  final scored = [
    for (var i = 0; i < docs.length; i++) (i, cosine(query, docs[i])),
  ];
  scored.sort((a, b) => b.$2.compareTo(a.$2));
  return scored;
}

void main() {
  print(cosine([1, 2, 3], [2, 4, 6]));
  print(cosine([1, 0], [0, 1]));
  print(
    rank(
      [1, 1, 0],
      [
        [2, 2, 0],
        [0, 1, 1],
        [1, 0, 0],
      ],
    ),
  );
}
