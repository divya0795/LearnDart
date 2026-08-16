// A typedef gives a function type a readable name, which keeps signatures
// short and documents intent.
typedef Predicate<T> = bool Function(T);
typedef Transform<A, B> = B Function(A);
typedef Reducer<T, R> = R Function(R acc, T item);
