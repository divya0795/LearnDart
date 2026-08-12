// Kadane's algorithm: the maximum sum of a contiguous, non-empty subarray.
//
// Scan once, tracking the best sum of a subarray that ends at the current
// element. That is either the element alone, or the element appended to
// the best subarray ending at the previous index -- whichever is larger.
// The answer is the best value seen at any index.
//
// Complexity: O(n) time, O(1) space.

int maxSubarraySum(List<int> a) {
  if (a.isEmpty) throw ArgumentError('empty list');
  var endingHere = a[0], best = a[0];
  for (var i = 1; i < a.length; i++) {
    endingHere = a[i] > endingHere + a[i] ? a[i] : endingHere + a[i];
    if (endingHere > best) best = endingHere;
  }
  return best;
}

/// Returns (sum, start, endInclusive) of a maximum subarray.
(int, int, int) maxSubarrayRange(List<int> a) {
  var endingHere = a[0], best = a[0];
  var s = 0, bs = 0, be = 0;
  for (var i = 1; i < a.length; i++) {
    if (a[i] > endingHere + a[i]) {
      endingHere = a[i];
      s = i;
    } else {
      endingHere += a[i];
    }
    if (endingHere > best) {
      best = endingHere;
      bs = s;
      be = i;
    }
  }
  return (best, bs, be);
}

void main() {
  final a = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  print('max sum = ${maxSubarraySum(a)}');
  final (sum, s, e) = maxSubarrayRange(a);
  print('range [$s..$e] = ${a.sublist(s, e + 1)} sums to $sum');
  print('all negative: ${maxSubarraySum([-8, -3, -6])}');
}
