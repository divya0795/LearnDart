// Weighted sampling: pick items with probability proportional to weight.
// Build the cumulative sum of weights, draw a number in [0, total) and
// binary search for the bucket it falls in.
import 'dart:math';

class WeightedSampler<T> {
  final List<T> items;
  final List<double> _cum = [];
  final Random _r;

  WeightedSampler(this.items, List<double> weights, {int seed = 5})
    : _r = Random(seed) {
    var s = 0.0;
    for (final w in weights) {
      s += w;
      _cum.add(s);
    }
  }

  T sample() {
    final x = _r.nextDouble() * _cum.last;
    var lo = 0, hi = _cum.length - 1;
    while (lo < hi) {
      final mid = (lo + hi) ~/ 2;
      if (_cum[mid] > x) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return items[lo];
  }
}
