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
