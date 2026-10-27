// Quickselect: find the k-th smallest element in O(n) average time by
// partitioning like quicksort but recursing into only one side.
int _partition(List<int> a, int lo, int hi) {
  final pivot = a[hi];
  var i = lo;
  for (var j = lo; j < hi; j++) {
    if (a[j] < pivot) {
      final t = a[i];
      a[i] = a[j];
      a[j] = t;
      i++;
    }
  }
  final t = a[i];
  a[i] = a[hi];
  a[hi] = t;
  return i;
}
