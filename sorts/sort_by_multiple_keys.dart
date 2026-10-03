// Sorting by multiple keys: compare the primary key and fall back to
// secondary keys on ties. A comparator that chains comparisons keeps the
// logic readable.
typedef Cmp<T> = int Function(T a, T b);

Cmp<T> thenBy<T>(Cmp<T> first, Cmp<T> second) => (a, b) {
  final c = first(a, b);
  return c != 0 ? c : second(a, b);
};

Cmp<T> descending<T>(Cmp<T> c) =>
    (a, b) => c(b, a);
