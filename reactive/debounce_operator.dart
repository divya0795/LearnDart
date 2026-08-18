// Debounce for push-based sources: after each value, wait; if another
// value arrives before the wait ends, restart the wait. Only the last
// value of a burst is delivered.
import 'dart:async';

class Debouncer<T> {
  final Duration wait;
  final void Function(T) onValue;
  Timer? _timer;
  Debouncer(this.wait, this.onValue);

  void add(T v) {
    _timer?.cancel();
    _timer = Timer(wait, () => onValue(v));
  }

  void dispose() => _timer?.cancel();
}

Future<void> main() async {
  final d = Debouncer<String>(
    const Duration(milliseconds: 30),
    (v) => print('search for "$v"'),
  );
  var typed = '';
  for (final c in 'dart'.split('')) {
    typed += c;
    d.add(typed);
    await Future.delayed(const Duration(milliseconds: 10));
  }
  await Future.delayed(const Duration(milliseconds: 60));
  d.add('flutter');
  await Future.delayed(const Duration(milliseconds: 60));
}
