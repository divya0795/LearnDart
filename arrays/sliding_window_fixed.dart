// Sliding window of fixed size k: instead of re-summing k elements for
// every position, add the entering element and subtract the leaving one.
int maxWindowSum(List<int> a, int k) {
  var sum = a.take(k).fold(0, (x, y) => x + y), best = sum;
  for (var i = k; i < a.length; i++) {
    sum += a[i] - a[i - k];
    if (sum > best) best = sum;
  }
  return best;
}

List<double> windowAverages(List<int> a, int k) {
  var sum = a.take(k).fold(0, (x, y) => x + y);
  final out = [sum / k];
  for (var i = k; i < a.length; i++) {
    sum += a[i] - a[i - k];
    out.add(sum / k);
  }
  return out;
}
