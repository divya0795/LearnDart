// Bitonic sort: a sorting network that works on lists whose length is a
// power of two. A bitonic sequence rises then falls; sorting two halves in
// opposite directions builds one, and a bitonic merge sorts it with a
// fixed pattern of compare-exchanges, independent of the data.

void _cmp(List<int> a, int i, int j, bool asc) {
  if ((a[i] > a[j]) == asc) {
    final t = a[i];
    a[i] = a[j];
    a[j] = t;
  }
}

void _merge(List<int> a, int lo, int n, bool asc) {
  if (n <= 1) return;
  final m = n ~/ 2;
  for (var i = lo; i < lo + m; i++) {
    _cmp(a, i, i + m, asc);
  }
  _merge(a, lo, m, asc);
  _merge(a, lo + m, m, asc);
}

void bitonicSort(List<int> a, [int lo = 0, int? n, bool asc = true]) {
  n ??= a.length;
  if (n <= 1) return;
  final m = n ~/ 2;
  bitonicSort(a, lo, m, true);
  bitonicSort(a, lo + m, m, false);
  _merge(a, lo, n, asc);
}
