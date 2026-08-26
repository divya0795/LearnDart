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

class PrefixSums2D {
  final List<List<int>> _p;
  PrefixSums2D(List<List<int>> m)
    : _p = List.generate(m.length + 1, (_) => List.filled(m[0].length + 1, 0)) {
    for (var i = 0; i < m.length; i++) {
      for (var j = 0; j < m[0].length; j++) {
        _p[i + 1][j + 1] = m[i][j] + _p[i][j + 1] + _p[i + 1][j] - _p[i][j];
      }
    }
  }

  int sum(int r1, int c1, int r2, int c2) =>
      _p[r2 + 1][c2 + 1] - _p[r1][c2 + 1] - _p[r2 + 1][c1] + _p[r1][c1];
}

void main() {
  final ps = PrefixSums([3, 1, 4, 1, 5, 9, 2, 6]);
  print(ps.sum(0, 7));
  print(ps.sum(2, 4));
  final g = PrefixSums2D([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ]);
  print(g.sum(1, 1, 2, 2));
}
