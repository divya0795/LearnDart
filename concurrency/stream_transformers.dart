// Streams deliver values over time. The core operators -- map, where,
// take, skip -- return new streams, so they can be chained like list
// methods but processed lazily as values arrive.
Stream<int> ticker(int n) async* {
  for (var i = 1; i <= n; i++) {
    await Future.delayed(const Duration(milliseconds: 5));
    yield i;
  }
}

Future<void> demoChain() async {
  final out = await ticker(10)
      .where((x) => x.isEven)
      .map((x) => x * x)
      .take(3)
      .toList();
  print('even squares: $out');
}

Future<void> demoFold() async {
  final sum = await ticker(5).fold<int>(0, (a, b) => a + b);
  print('sum: $sum');
  print('first > 3: ${await ticker(10).firstWhere((x) => x > 3)}');
}

Stream<double> runningAverage(Stream<int> s) async* {
  var n = 0, total = 0;
  await for (final x in s) {
    n++;
    total += x;
    yield total / n;
  }
}

Future<void> main() async {
  await demoChain();
  await demoFold();
  print('running average: ${await runningAverage(ticker(5)).toList()}');
}
