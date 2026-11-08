// Smoothing noisy series. A simple moving average averages the last k
// values; an exponential moving average weights recent values more with
// smoothing factor alpha.
List<double> sma(List<num> xs, int k) => [
  for (var i = k - 1; i < xs.length; i++)
    xs.sublist(i - k + 1, i + 1).fold<double>(0, (a, b) => a + b) / k,
];
