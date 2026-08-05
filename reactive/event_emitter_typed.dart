// A small typed event emitter: handlers register per event name, emit
// calls every handler, and `on` returns a function that unsubscribes.
// `once` registers a handler that removes itself after the first call.
class Emitter {
  final _handlers = <String, List<void Function(Object?)>>{};

  void Function() on(String event, void Function(Object?) h) {
    _handlers.putIfAbsent(event, () => []).add(h);
    return () => _handlers[event]?.remove(h);
  }

  void once(String event, void Function(Object?) h) {
    late void Function() off;
    off = on(event, (d) {
      off();
      h(d);
    });
  }

  int emit(String event, [Object? data]) {
    final hs = List.of(_handlers[event] ?? []);
    for (final h in hs) {
      h(data);
    }
    return hs.length;
  }
}

void main() {
  final e = Emitter();
  final off = e.on('msg', (d) => print('A: $d'));
  e.once('msg', (d) => print('B (once): $d'));
  print('delivered to ${e.emit('msg', 'hello')}');
  off();
  print('delivered to ${e.emit('msg', 'again')}');
}
