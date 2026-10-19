// Convert seconds to a clock-style string and back, handling hours that
// exceed 24 and zero padding.
String formatSeconds(int total) {
  final h = total ~/ 3600, m = total % 3600 ~/ 60, s = total % 60;
  String two(int v) => v.toString().padLeft(2, '0');
  return h > 0 ? '$h:${two(m)}:${two(s)}' : '$m:${two(s)}';
}

int parseClock(String s) {
  final parts = s.split(':').map(int.parse).toList();
  return parts.fold(0, (acc, p) => acc * 60 + p);
}

String humanDuration(int seconds) {
  if (seconds == 0) return '0 seconds';
  final parts = <String>[];
  for (final (unit, size) in [
    ('day', 86400),
    ('hour', 3600),
    ('minute', 60),
    ('second', 1),
  ]) {
    final n = seconds ~/ size;
    seconds %= size;
    if (n > 0) parts.add('$n $unit${n == 1 ? '' : 's'}');
  }
  return parts.join(', ');
}

void main() {
  for (final s in [5, 65, 3600, 3725, 90061]) {
    print('$s -> ${formatSeconds(s)} | ${humanDuration(s)}');
  }
  print(parseClock('1:02:05'));
}
