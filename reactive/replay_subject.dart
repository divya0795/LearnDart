// ReplaySubject: remembers the last [bufferSize] values and replays them,
// in order, to every new subscriber. Useful when late subscribers need a
// short history (e.g. the last 3 chat messages).
class ReplaySubject<T> {
  final int bufferSize;
  final _buffer = <T>[];
  final _listeners = <void Function(T)>[];
  ReplaySubject(this.bufferSize);

  void next(T v) {
    _buffer.add(v);
    if (_buffer.length > bufferSize) _buffer.removeAt(0);
    for (final l in List.of(_listeners)) {
      l(v);
    }
  }

  void Function() listen(void Function(T) onData) {
    for (final v in List.of(_buffer)) {
      onData(v);
    }
    _listeners.add(onData);
    return () => _listeners.remove(onData);
  }
}

void main() {
  final s = ReplaySubject<String>(2);
  for (final m in ['m1', 'm2', 'm3', 'm4']) {
    s.next(m);
  }
  s.listen((m) => print('late subscriber got $m'));
  s.next('m5');
}
