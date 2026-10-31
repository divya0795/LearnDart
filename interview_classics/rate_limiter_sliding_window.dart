// Sliding-window rate limiter: allow a user at most [limit] requests in
// any [windowMs] period by remembering recent request times.
class RateLimiter {
  final int limit, windowMs;
  final _log = <String, List<int>>{};
  RateLimiter(this.limit, this.windowMs);

  bool allow(String user, int nowMs) {
    final q = _log.putIfAbsent(user, () => []);
    q.removeWhere((t) => t <= nowMs - windowMs);
    if (q.length >= limit) return false;
    q.add(nowMs);
    return true;
  }
}

void main() {
  final r = RateLimiter(3, 1000);
  for (final t in [0, 100, 200, 300, 999, 1000, 1150, 1250]) {
    print('t=$t alice: ${r.allow('alice', t)}');
  }
  print('bob is independent: ${r.allow('bob', 300)}');
}
