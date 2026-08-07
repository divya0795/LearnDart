// A heartbeat failure detector: nodes send periodic heartbeats; a node
// whose last heartbeat is older than a timeout is suspected failed. The
// clock is injected as a parameter so behaviour is easy to test.
class FailureDetector {
  final int timeoutMs;
  final _last = <String, int>{};
  FailureDetector(this.timeoutMs);

  void heartbeat(String node, int nowMs) => _last[node] = nowMs;

  bool isAlive(String node, int nowMs) {
    final t = _last[node];
    return t != null && nowMs - t <= timeoutMs;
  }

  List<String> suspected(int nowMs) => [
    for (final e in _last.entries)
      if (nowMs - e.value > timeoutMs) e.key,
  ]..sort();
}

void main() {
  final d = FailureDetector(100);
  d.heartbeat('a', 0);
  d.heartbeat('b', 0);
  d.heartbeat('a', 90);
  d.heartbeat('a', 180);
  print('t=150 suspected: ${d.suspected(150)}');
  print('t=250 suspected: ${d.suspected(250)}');
  d.heartbeat('b', 260);
  print('t=270 b alive again: ${d.isAlive('b', 270)}');
}
