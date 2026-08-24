// Helpers every sorting experiment needs: is the list sorted, and is the
// output a permutation of the input?
//
// A sort could "pass" an is-sorted check by returning an empty list, so a
// real test also compares multisets of elements.

bool isSorted(List<int> a) {
  for (var i = 1; i < a.length; i++) {
    if (a[i - 1] > a[i]) return false;
  }
  return true;
}

bool samePermutation(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  final c = <int, int>{};
  for (final x in a) {
    c[x] = (c[x] ?? 0) + 1;
  }
  for (final x in b) {
    final n = (c[x] ?? 0) - 1;
    if (n < 0) return false;
    c[x] = n;
  }
  return true;
}
