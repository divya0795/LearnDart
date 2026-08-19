// Publish/subscribe: publishers send messages to named topics without
// knowing who is listening; subscribers receive messages for topics they
// registered for. Topic patterns ending in * match prefixes.
class Bus {
  final _subs = <String, List<void Function(String, Object?)>>{};

  void Function() subscribe(String topic, void Function(String, Object?) h) {
    _subs.putIfAbsent(topic, () => []).add(h);
    return () => _subs[topic]?.remove(h);
  }

  int publish(String topic, [Object? msg]) {
    var n = 0;
    for (final e in _subs.entries) {
      final match =
          e.key == topic ||
          (e.key.endsWith('*') &&
              topic.startsWith(e.key.substring(0, e.key.length - 1)));
      if (match) {
        for (final h in List.of(e.value)) {
          h(topic, msg);
          n++;
        }
      }
    }
    return n;
  }
}
