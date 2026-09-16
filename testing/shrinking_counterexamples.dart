// When a property fails on a large random input, shrinking searches for a
// smaller input that still fails, which makes bugs far easier to
// understand. Strategy: try removing elements, then simplifying values.
List<int> shrink(List<int> failing, bool Function(List<int>) holds) {
  var cur = failing;
  var changed = true;
  while (changed) {
    changed = false;
    for (var i = 0; i < cur.length; i++) {
      final smaller = [...cur]..removeAt(i);
      if (!holds(smaller)) {
        cur = smaller;
        changed = true;
        break;
      }
    }
  }
  for (var i = 0; i < cur.length; i++) {
    for (final v in [0, 1, cur[i] ~/ 2]) {
      if (v.abs() < cur[i].abs()) {
        final t = [...cur]..[i] = v;
        if (!holds(t)) cur = t;
      }
    }
  }
  return cur;
}
