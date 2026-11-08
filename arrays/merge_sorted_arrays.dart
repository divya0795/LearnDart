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
