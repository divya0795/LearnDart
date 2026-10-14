// A sort is stable if equal elements keep their original relative order.
// That matters when sorting records by one key after another. Dart's
// List.sort is not guaranteed stable, so here is a stable merge sort and
// a demonstration of the difference.
List<T> stableSort<T>(List<T> xs, int Function(T, T) cmp) {
  if (xs.length < 2) return xs;
  final mid = xs.length ~/ 2;
  final l = stableSort(xs.sublist(0, mid), cmp),
      r = stableSort(xs.sublist(mid), cmp);
  final out = <T>[];
  var i = 0, j = 0;
  while (i < l.length && j < r.length) {
    out.add(cmp(l[i], r[j]) <= 0 ? l[i++] : r[j++]);
  }
  return out
    ..addAll(l.sublist(i))
    ..addAll(r.sublist(j));
}
