// Trapping rain water: given bar heights, how much water stays trapped?
//
// Water above bar i rises to min(tallest bar to its left, tallest bar to
// its right) and is that level minus the bar height (never negative).
//

// Version 1 precomputes prefix/suffix maxima: O(n) time, O(n) space.
int trapPrefixSuffix(List<int> h) {
  final n = h.length;
  if (n == 0) return 0;
  final left = List.filled(n, 0), right = List.filled(n, 0);
  left[0] = h[0];
  for (var i = 1; i < n; i++) {
    left[i] = h[i] > left[i - 1] ? h[i] : left[i - 1];
  }
  right[n - 1] = h[n - 1];
  for (var i = n - 2; i >= 0; i--) {
    right[i] = h[i] > right[i + 1] ? h[i] : right[i + 1];
  }
  var water = 0;
  for (var i = 0; i < n; i++) {
    water += (left[i] < right[i] ? left[i] : right[i]) - h[i];
  }
  return water;
}
