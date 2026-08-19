// Merge overlapping intervals.
//
// Sort by start; then sweep, extending the last merged interval whenever
// the next one starts at or before its end, otherwise starting a new one.
//
// Complexity: O(n log n) for the sort, O(n) for the sweep.

List<(int, int)> mergeIntervals(List<(int, int)> xs) {
  if (xs.isEmpty) return [];
  final s = [...xs]..sort((a, b) => a.$1.compareTo(b.$1));
  final out = [s.first];
  for (final (a, b) in s.skip(1)) {
    final (la, lb) = out.last;
    if (a <= lb) {
      out[out.length - 1] = (la, b > lb ? b : lb);
    } else {
      out.add((a, b));
    }
  }
  return out;
}

void main() {
  print(mergeIntervals([(1, 3), (8, 10), (2, 6), (15, 18), (17, 20)]));
  print(mergeIntervals([(1, 4), (4, 5)]));
  print(mergeIntervals([]));
}
