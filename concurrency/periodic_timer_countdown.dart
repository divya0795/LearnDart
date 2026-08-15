// Timer.periodic fires a callback at a fixed interval until cancelled.
// Wrapping it in a Future lets callers await the countdown finishing.
import 'dart:async';

Future<void> countdown(
  int from, {
  Duration tick = const Duration(milliseconds: 20),
}) {
  final done = Completer<void>();
  var n = from;
  Timer.periodic(tick, (t) {
    print(n > 0 ? '$n...' : 'liftoff!');
    if (n-- == 0) {
      t.cancel();
      done.complete();
    }
  });
  return done.future;
}
