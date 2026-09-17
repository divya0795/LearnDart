// Descriptive statistics: mean, median, mode, variance and standard
// deviation of a list of numbers.
double mean(List<num> xs) => xs.fold<num>(0, (a, b) => a + b) / xs.length;

double median(List<num> xs) {
  final s = [...xs]..sort();
  final n = s.length;
  return n.isOdd ? s[n ~/ 2].toDouble() : (s[n ~/ 2 - 1] + s[n ~/ 2]) / 2;
}

List<num> mode(List<num> xs) {
  final counts = <num, int>{};
  for (final x in xs) {
    counts[x] = (counts[x] ?? 0) + 1;
  }
  final top = counts.values.reduce((a, b) => a > b ? a : b);
  return [
    for (final e in counts.entries)
      if (e.value == top) e.key,
  ]..sort();
}
