// Stooge sort: a deliberately inefficient recursive sort, studied because
// its analysis is neat.
//
// If the first element is larger than the last, swap them. Then sort the
// first 2/3, the last 2/3, and the first 2/3 again. It runs in
// O(n^2.71), slower than bubble sort.

void stoogeSort(List<int> a, [int lo = 0, int? hi]) {
  hi ??= a.length - 1;
  if (a[lo] > a[hi]) {
    final t = a[lo];
    a[lo] = a[hi];
    a[hi] = t;
  }
  if (hi - lo + 1 > 2) {
    final third = (hi - lo + 1) ~/ 3;
    stoogeSort(a, lo, hi - third);
    stoogeSort(a, lo + third, hi);
    stoogeSort(a, lo, hi - third);
  }
}
