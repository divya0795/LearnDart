// A task queue that runs async jobs sequentially, preserving submission
// order even though each job takes a different time. Each new job waits
// for the previous one's future.
class TaskQueue {
  Future<void> _tail = Future.value();

  Future<T> add<T>(Future<T> Function() job) {
    final result = _tail.then((_) => job());
    _tail = result.then((_) {}, onError: (_) {});
    return result;
  }
}
