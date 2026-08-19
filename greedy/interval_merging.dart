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
