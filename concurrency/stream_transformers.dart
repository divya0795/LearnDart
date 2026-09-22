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
