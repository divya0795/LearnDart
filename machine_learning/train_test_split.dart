// Hold out part of the data to evaluate a model on examples it never saw.
// Shuffle with a fixed seed so the split is reproducible, then cut.
import 'dart:math';

({List<T> train, List<T> test}) trainTestSplit<T>(
  List<T> data, {
  double testFraction = 0.2,
  int seed = 42,
}) {
  final shuffled = [...data]..shuffle(Random(seed));
  final nTest = (data.length * testFraction).round();
  return (train: shuffled.sublist(nTest), test: shuffled.sublist(0, nTest));
}

List<(List<int>, List<int>)> kFold(int n, int k, {int seed = 1}) {
  final idx = List.generate(n, (i) => i)..shuffle(Random(seed));
  return [
    for (var f = 0; f < k; f++)
      (
        [
          for (var i = 0; i < n; i++)
            if (i % k != f) idx[i],
        ],
        [
          for (var i = 0; i < n; i++)
            if (i % k == f) idx[i],
        ],
      ),
  ];
}
