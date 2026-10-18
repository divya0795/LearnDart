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

void main() {
  final c = HitCounter();
  for (final t in [1, 2, 3, 100, 299, 300, 301]) {
    c.hit(t);
  }
  print('at 300: ${c.count(300)}');
  print('at 302: ${c.count(302)}');
  print('at 700: ${c.count(700)}');
}
