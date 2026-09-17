// Future.wait runs futures concurrently and returns all results in order.
// By default a single failure fails the whole wait; `eagerError: false`
// still waits for the others before reporting.
Future<int> work(String name, int ms, {bool fail = false}) async {
  await Future.delayed(Duration(milliseconds: ms));
  if (fail) throw StateError('$name failed');
  return ms;
}

Future<void> demoAllSucceed() async {
  final r = await Future.wait([work('a', 30), work('b', 10), work('c', 20)]);
  print('results in input order: $r');
}

Future<void> demoPartialFailure() async {
  final results = await Future.wait([
    for (final (n, ms, f) in [
      ('a', 10, false),
      ('b', 20, true),
      ('c', 5, false),
    ])
      work(
        n,
        ms,
        fail: f,
      ).then<String>((v) => 'ok:$v').catchError((Object e) => 'error:$e'),
  ]);
  print(results);
}
