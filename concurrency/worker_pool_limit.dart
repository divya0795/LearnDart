// Run many async tasks but never more than [limit] at the same time. A
// small pool pulls the next task whenever one finishes.
Future<List<T>> runLimited<T>(
  List<Future<T> Function()> tasks,
  int limit,
) async {
  final results = List<T?>.filled(tasks.length, null);
  var next = 0;
  Future<void> worker() async {
    while (next < tasks.length) {
      final i = next++;
      results[i] = await tasks[i]();
    }
  }

  await Future.wait([for (var i = 0; i < limit; i++) worker()]);
  return results.cast<T>();
}

Future<void> main() async {
  var running = 0, peak = 0;
  final tasks = [
    for (var i = 0; i < 8; i++)
      () async {
        running++;
        if (running > peak) peak = running;
        await Future.delayed(Duration(milliseconds: 10 + i * 3));
        running--;
        return i * i;
      },
  ];
  print(await runLimited(tasks, 3));
  print('peak concurrency: $peak');
}
