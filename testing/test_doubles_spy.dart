// A spy wraps a function and records its calls so a test can assert how it
// was used, without changing its behaviour.
class Spy<A, R> {
  final R Function(A) _inner;
  final calls = <A>[];
  Spy(this._inner);

  R call(A arg) {
    calls.add(arg);
    return _inner(arg);
  }

  int get callCount => calls.length;
}

int sumWithLogging(List<int> xs, void Function(int) log) {
  var total = 0;
  for (final x in xs) {
    total += x;
    log(total);
  }
  return total;
}
