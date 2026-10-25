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
