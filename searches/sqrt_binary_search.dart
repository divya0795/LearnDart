// Integer square root by binary search over the answer.
//
// The answer is the largest r with r*r <= n. Because r*r is monotonic,
// binary search on r in [0, n] finds it without floating point.

int isqrt(int n) {
  var lo = 0, hi = n;
  while (lo < hi) {
    final mid = lo + (hi - lo + 1) ~/ 2;
    if (mid <= n ~/ mid) {
      lo = mid;
    } else {
      hi = mid - 1;
    }
  }
  return lo;
}
