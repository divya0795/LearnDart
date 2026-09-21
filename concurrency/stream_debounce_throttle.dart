// Debounce: emit a value only after no new value arrived for [wait].
// Useful for search-as-you-type, where only the final text matters.
import 'dart:async';

Stream<T> debounceStream<T>(Stream<T> s, Duration wait) {
  Timer? timer;
  late StreamController<T> out;
  out = StreamController<T>(
    onListen: () {
      s.listen(
        (v) {
          timer?.cancel();
          timer = Timer(wait, () => out.add(v));
        },
        onDone: () {
          timer?.cancel();
          Timer(wait * 2, out.close);
        },
      );
    },
  );
  return out.stream;
}

Stream<T> throttleStream<T>(Stream<T> s, Duration gap) async* {
  DateTime? last;
  await for (final v in s) {
    final now = DateTime.now();
    if (last == null || now.difference(last) >= gap) {
      last = now;
      yield v;
    }
  }
}
