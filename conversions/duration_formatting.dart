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
