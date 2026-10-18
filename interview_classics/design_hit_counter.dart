// Hit counter: how many hits in the last 5 minutes? Store timestamps in a
// queue; on each query drop those older than the window.
import 'dart:collection';

class HitCounter {
  final int windowSeconds;
  final _hits = Queue<int>();
  HitCounter([this.windowSeconds = 300]);

  void hit(int t) => _hits.addLast(t);

  int count(int now) {
    while (_hits.isNotEmpty && _hits.first <= now - windowSeconds) {
      _hits.removeFirst();
    }
    return _hits.length;
  }
}
