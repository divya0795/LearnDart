// Sleep sort: each number "sleeps" for a time proportional to its value
// and is output when it wakes. Smaller numbers wake first. It is a joke
// algorithm (it depends on the scheduler and only works for non-negative
// numbers), but a nice demo of Dart futures.
//
// Here the delays are tiny so the example runs quickly.

Future<List<int>> sleepSort(List<int> xs) async {
  final out = <int>[];
  await Future.wait([
    for (final x in xs)
      Future.delayed(Duration(milliseconds: x * 5), () => out.add(x)),
  ]);
  return out;
}
