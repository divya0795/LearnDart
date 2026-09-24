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
