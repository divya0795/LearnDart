// Batching: collect items from a stream into lists of at most [size], and
// flush the remainder when the stream ends. Useful for bulk inserts.
Stream<List<T>> batch<T>(Stream<T> s, int size) async* {
  var buf = <T>[];
  await for (final v in s) {
    buf.add(v);
    if (buf.length == size) {
      yield buf;
      buf = [];
    }
  }
  if (buf.isNotEmpty) yield buf;
}

Future<void> main() async {
  final s = Stream.fromIterable(List.generate(10, (i) => i + 1));
  await for (final b in batch(s, 4)) {
    print('insert ${b.length} rows: $b');
  }
}
