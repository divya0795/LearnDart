// A keyed lock: tasks sharing a key run one after another, while tasks
// with different keys run in parallel. Each key remembers the future of
// its last task and chains the next one after it.
class KeyedLock {
  final _tails = <String, Future<void>>{};

  Future<T> run<T>(String key, Future<T> Function() task) {
    final prev = _tails[key] ?? Future<void>.value();
    final result = prev.then((_) => task());
    _tails[key] = result.then((_) {}, onError: (_) {});
    return result;
  }
}
