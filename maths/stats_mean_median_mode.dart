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

double variance(List<num> xs, {bool sample = false}) {
  final m = mean(xs);
  final ss = xs.fold<double>(0, (a, b) => a + (b - m) * (b - m));
  return ss / (xs.length - (sample ? 1 : 0));
}

double stdDev(List<num> xs, {bool sample = false}) {
  final v = variance(xs, sample: sample);
  var x = v == 0 ? 0.0 : v;
  for (var i = 0; i < 50 && x > 0; i++) {
    x = (x + v / x) / 2;
  }
  return x;
}

void main() {
  final d = [2, 4, 4, 4, 5, 5, 7, 9];
  print('mean ${mean(d)} median ${median(d)} mode ${mode(d)}');
  print('population variance ${variance(d)} std ${stdDev(d)}');
  print('sample std ${stdDev(d, sample: true).toStringAsFixed(4)}');
}
