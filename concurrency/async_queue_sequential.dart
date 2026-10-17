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

Future<void> main() async {
  final q = TaskQueue();
  final order = <String>[];
  Future<void> job(String name, int ms) => q.add(() async {
    await Future.delayed(Duration(milliseconds: ms));
    order.add(name);
  });
  await Future.wait([job('slow', 40), job('fast', 5), job('medium', 20)]);
  print(order);
}
