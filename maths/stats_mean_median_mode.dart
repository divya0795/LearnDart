// Descriptive statistics: mean, median, mode, variance and standard
// deviation of a list of numbers.
double mean(List<num> xs) => xs.fold<num>(0, (a, b) => a + b) / xs.length;

double median(List<num> xs) {
  final s = [...xs]..sort();
  final n = s.length;
  return n.isOdd ? s[n ~/ 2].toDouble() : (s[n ~/ 2 - 1] + s[n ~/ 2]) / 2;
}
