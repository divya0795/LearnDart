// A typedef gives a function type a readable name, which keeps signatures
// short and documents intent.
typedef Predicate<T> = bool Function(T);
typedef Transform<A, B> = B Function(A);
typedef Reducer<T, R> = R Function(R acc, T item);

List<T> filter<T>(List<T> xs, Predicate<T> p) => [
  for (final x in xs)
    if (p(x)) x,
];
List<B> mapAll<A, B>(List<A> xs, Transform<A, B> f) => [
  for (final x in xs) f(x),
];
R reduce<T, R>(List<T> xs, R init, Reducer<T, R> f) {
  var acc = init;
  for (final x in xs) {
    acc = f(acc, x);
  }
  return acc;
}

Predicate<T> not<T>(Predicate<T> p) =>
    (x) => !p(x);
Predicate<T> both<T>(Predicate<T> a, Predicate<T> b) =>
    (x) => a(x) && b(x);

void main() {
  final xs = [1, 2, 3, 4, 5, 6];
  bool even(int x) => x.isEven;
  print(filter(xs, even));
  print(filter(xs, not(even)));
  print(filter(xs, both<int>(even, (x) => x > 2)));
  print(mapAll(xs, (x) => 'n$x'));
  print(reduce<int, int>(xs, 0, (a, b) => a + b));
}
