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
