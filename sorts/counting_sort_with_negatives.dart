// Counting sort runs in O(n + range) by counting occurrences. To support
// negative numbers shift every value by the minimum so indices start at 0.
List<int> countingSort(List<int> a) {
  if (a.isEmpty) return [];
  final lo = a.reduce((x, y) => x < y ? x : y),
      hi = a.reduce((x, y) => x > y ? x : y);
  final counts = List.filled(hi - lo + 1, 0);
  for (final x in a) {
    counts[x - lo]++;
  }
  return [
    for (var i = 0; i < counts.length; i++)
      for (var k = 0; k < counts[i]; k++) i + lo,
  ];
}

void main() {
  print(countingSort([4, -2, 7, 0, -2, 3, 4]));
  print(countingSort([]));
  print(countingSort([5]));
}
