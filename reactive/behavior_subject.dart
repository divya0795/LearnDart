// BehaviorSubject: a subject that remembers its latest value and replays
// it to every new subscriber, so late subscribers never miss the current
// state. It is both an observer (call `next`) and an observable
// (call `listen`). Typical use: a piece of UI state like "current user".

class BehaviorSubject<T> {
  T _value;
  final _listeners = <void Function(T)>[];
  BehaviorSubject(this._value);

  T get value => _value;

  void next(T v) {
    _value = v;
    for (final l in List.of(_listeners)) {
      l(v);
    }
  }

  /// Emits the current value immediately, then every later one.
  void Function() listen(void Function(T) onData) {
    _listeners.add(onData);
    onData(_value);
    return () => _listeners.remove(onData);
  }
}
