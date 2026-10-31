// Top-k elements in O(n log k): keep a min-heap of size k; whenever a
// bigger element arrives, replace the heap's smallest. After one pass the
// heap holds the k largest values.
class MinHeap {
  final _a = <int>[];
  int get length => _a.length;
  int get min => _a.first;

  void add(int x) {
    _a.add(x);
    var i = _a.length - 1;
    while (i > 0 && _a[(i - 1) ~/ 2] > _a[i]) {
      final p = (i - 1) ~/ 2;
      final t = _a[p];
      _a[p] = _a[i];
      _a[i] = t;
      i = p;
    }
  }

  int removeMin() {
    final top = _a.first, last = _a.removeLast();
    if (_a.isNotEmpty) {
      _a[0] = last;
      var i = 0;
      while (true) {
        var s = i;
        final l = 2 * i + 1, r = l + 1;
        if (l < _a.length && _a[l] < _a[s]) s = l;
        if (r < _a.length && _a[r] < _a[s]) s = r;
        if (s == i) break;
        final t = _a[s];
        _a[s] = _a[i];
        _a[i] = t;
        i = s;
      }
    }
    return top;
  }
}

List<int> topK(List<int> xs, int k) {
  final h = MinHeap();
  for (final x in xs) {
    if (h.length < k) {
      h.add(x);
    } else if (x > h.min) {
      h.removeMin();
      h.add(x);
    }
  }
  final out = <int>[];
  while (h.length > 0) {
    out.add(h.removeMin());
  }
  return out.reversed.toList();
}
