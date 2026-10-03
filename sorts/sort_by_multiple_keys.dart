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

void main() {
  final staff = [
    ('Eve', 'eng', 120),
    ('Bob', 'ops', 90),
    ('Ann', 'eng', 150),
    ('Dan', 'ops', 90),
    ('Cat', 'eng', 120),
  ];
  final cmp = thenBy<(String, String, int)>(
    (a, b) => a.$2.compareTo(b.$2),
    thenBy(
      descending((a, b) => a.$3.compareTo(b.$3)),
      (a, b) => a.$1.compareTo(b.$1),
    ),
  );
  for (final p in [...staff]..sort(cmp)) {
    print(p);
  }
}
