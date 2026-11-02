// Sparse table: answers range-minimum queries in O(1) after O(n log n)
// preprocessing. table[j][i] is the minimum of the 2^j elements starting
// at i; any range is covered by two overlapping power-of-two blocks.
class SparseTable {
  final List<List<int>> _t;
  final List<int> _log;

  SparseTable(List<int> a)
    : _t = [List.of(a)],
      _log = List.filled(a.length + 2, 0) {
    for (var i = 2; i < _log.length; i++) {
      _log[i] = _log[i ~/ 2] + 1;
    }
    for (var j = 1; (1 << j) <= a.length; j++) {
      final prev = _t[j - 1];
      _t.add([
        for (var i = 0; i + (1 << j) <= a.length; i++)
          prev[i] < prev[i + (1 << (j - 1))]
              ? prev[i]
              : prev[i + (1 << (j - 1))],
      ]);
    }
  }

  int min(int l, int r) {
    final j = _log[r - l + 1];
    final x = _t[j][l], y = _t[j][r - (1 << j) + 1];
    return x < y ? x : y;
  }
}

void main() {
  final st = SparseTable([5, 2, 4, 7, 1, 3, 6, 8]);
  print(st.min(0, 7));
  print(st.min(0, 3));
  print(st.min(5, 7));
  print(st.min(3, 3));
}
