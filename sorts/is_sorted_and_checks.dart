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
