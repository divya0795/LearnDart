// Isolate.run runs a function on a separate isolate (its own memory and
// event loop), keeping the main isolate responsive. Arguments and results
// are copied between isolates.
import 'dart:isolate';

int heavySum(int n) {
  var s = 0;
  for (var i = 1; i <= n; i++) {
    s += i % 7;
  }
  return s;
}
