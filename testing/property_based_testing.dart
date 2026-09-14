// Property-based testing: instead of fixed examples, state a property that
// must hold for ALL inputs and check it on many random ones. A fixed seed
// makes failures reproducible.
import 'dart:math';

List<int> randomList(Random r) =>
    List.generate(r.nextInt(12), (_) => r.nextInt(100) - 50);

String? checkProperty(
  String name,
  bool Function(List<int>) prop, {
  int runs = 200,
  int seed = 1,
}) {
  final r = Random(seed);
  for (var i = 0; i < runs; i++) {
    final input = randomList(r);
    if (!prop(input)) return '$name FAILED for $input';
  }
  return null;
}

bool isSorted(List<int> a) {
  for (var i = 1; i < a.length; i++) {
    if (a[i - 1] > a[i]) return false;
  }
  return true;
}
