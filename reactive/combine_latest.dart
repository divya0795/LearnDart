// combineLatest: emit a combined value whenever ANY source emits, using the
// most recent value from each. Nothing is emitted until every source has
// produced at least one value.
class Source<T> {
  final _listeners = <void Function(T)>[];
  void emit(T v) {
    for (final l in List.of(_listeners)) {
      l(v);
    }
  }

  void listen(void Function(T) l) => _listeners.add(l);
}
