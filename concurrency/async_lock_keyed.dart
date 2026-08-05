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

Future<void> main() async {
  final lock = KeyedLock();
  final log = <String>[];
  Future<void> job(String key, String name) => lock.run(key, () async {
    log.add('start $name');
    await Future.delayed(const Duration(milliseconds: 20));
    log.add('end $name');
  });
  await Future.wait([job('x', 'x1'), job('x', 'x2'), job('y', 'y1')]);
  print(log.join('\n'));
}
