// Merge two sorted lists into one sorted list.
//
// Keep a pointer into each list; repeatedly take the smaller front
// element. When one list runs out, append the rest of the other. This is
// the "merge" step of merge sort.
//
// Complexity: O(n + m) time and space.

List<int> merge(List<int> a, List<int> b) {
  final out = <int>[];
  var i = 0, j = 0;
  while (i < a.length && j < b.length) {
    out.add(a[i] <= b[j] ? a[i++] : b[j++]);
  }
  out
    ..addAll(a.sublist(i))
    ..addAll(b.sublist(j));
  return out;
}

List<int> mergeAll(List<List<int>> lists) {
  if (lists.isEmpty) return [];
  var cur = lists;
  while (cur.length > 1) {
    final next = <List<int>>[];
    for (var i = 0; i < cur.length; i += 2) {
      next.add(i + 1 < cur.length ? merge(cur[i], cur[i + 1]) : cur[i]);
    }
    cur = next;
  }
  return cur.first;
}

void main() {
  print(merge([1, 3, 5], [2, 4, 6, 8]));
  print(merge([], [1, 2]));
  print(
    mergeAll([
      [1, 4, 7],
      [2, 5],
      [0, 3, 6, 9],
    ]),
  );
}
