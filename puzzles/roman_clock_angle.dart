// The angle between the hour and minute hands at time h:m. The minute
// hand moves 6 degrees per minute; the hour hand 30 degrees per hour plus
// 0.5 degrees per minute. Report the smaller angle.
double clockAngle(int h, int m) {
  final hour = (h % 12) * 30 + m * 0.5;
  final minute = m * 6.0;
  final diff = (hour - minute).abs();
  return diff > 180 ? 360 - diff : diff;
}

int overlapsIn12Hours() {
  var count = 0;
  for (var t = 0; t < 12 * 60; t++) {
    final hour = (t / 60 % 12) * 30 + (t % 60) * 0.5;
    final minute = (t % 60) * 6.0;
    if ((hour - minute).abs() < 3) count++;
  }
  return count;
}

void main() {
  for (final (h, m) in [(3, 0), (12, 30), (6, 0), (9, 15), (12, 0)]) {
    print('$h:${m.toString().padLeft(2, '0')} -> ${clockAngle(h, m)} degrees');
  }
}
