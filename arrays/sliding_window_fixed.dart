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

int minSubarrayLen(int target, List<int> a) {
  var l = 0, sum = 0, best = a.length + 1;
  for (var r = 0; r < a.length; r++) {
    sum += a[r];
    while (sum >= target) {
      if (r - l + 1 < best) best = r - l + 1;
      sum -= a[l++];
    }
  }
  return best == a.length + 1 ? 0 : best;
}
