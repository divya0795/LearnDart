// "Binary search on the answer": when you can test whether a value works
// and the answers form [no, no, ..., yes, yes], binary search finds the
// smallest value that works. Here: the smallest eating speed that lets
// Koko finish all banana piles within h hours.
int minEatingSpeed(List<int> piles, int h) {
  bool canFinish(int k) {
    var hours = 0;
    for (final p in piles) {
      hours += (p + k - 1) ~/ k;
    }
    return hours <= h;
  }

  var lo = 1, hi = piles.reduce((a, b) => a > b ? a : b);
  while (lo < hi) {
    final mid = (lo + hi) ~/ 2;
    if (canFinish(mid)) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo;
}
