// Range sum queries in O(1) after O(n) preprocessing: store prefix[i] =
// sum of the first i elements, then sum(l..r) = prefix[r+1] - prefix[l].
class PrefixSums {
  final List<int> _p;
  PrefixSums(List<int> a) : _p = _build(a);

  static List<int> _build(List<int> a) {
    final p = List.filled(a.length + 1, 0);
    for (var i = 0; i < a.length; i++) {
      p[i + 1] = p[i] + a[i];
    }
    return p;
  }

  int sum(int l, int r) => _p[r + 1] - _p[l];
}
