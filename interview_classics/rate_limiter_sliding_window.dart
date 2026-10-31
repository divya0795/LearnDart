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
