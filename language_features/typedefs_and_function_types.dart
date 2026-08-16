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
