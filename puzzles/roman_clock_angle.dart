// The angle between the hour and minute hands at time h:m. The minute
// hand moves 6 degrees per minute; the hour hand 30 degrees per hour plus
// 0.5 degrees per minute. Report the smaller angle.
double clockAngle(int h, int m) {
  final hour = (h % 12) * 30 + m * 0.5;
  final minute = m * 6.0;
  final diff = (hour - minute).abs();
  return diff > 180 ? 360 - diff : diff;
}
