// Smoothing noisy series. A simple moving average averages the last k
// values; an exponential moving average weights recent values more with
// smoothing factor alpha.
List<double> sma(List<num> xs, int k) => [
  for (var i = k - 1; i < xs.length; i++)
    xs.sublist(i - k + 1, i + 1).fold<double>(0, (a, b) => a + b) / k,
];

List<double> ema(List<num> xs, double alpha) {
  final out = <double>[xs.first.toDouble()];
  for (final x in xs.skip(1)) {
    out.add(alpha * x + (1 - alpha) * out.last);
  }
  return out;
}

void main() {
  const data = [10, 12, 9, 14, 20, 18, 25, 22];
  print(sma(data, 3).map((x) => x.toStringAsFixed(1)).toList());
  print(ema(data, 0.5).map((x) => x.toStringAsFixed(1)).toList());
}
