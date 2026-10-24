// First and last position of a value in a sorted list with duplicates.
//
// A normal binary search stops at any match. To find the first, keep
// searching left after a hit; for the last, keep searching right.
//
// Complexity: O(log n) each.

int firstOccurrence(List<int> a, int x) {
  var lo = 0, hi = a.length - 1, ans = -1;
  while (lo <= hi) {
    final mid = lo + (hi - lo) ~/ 2;
    if (a[mid] == x) ans = mid;
    if (a[mid] >= x) {
      hi = mid - 1;
    } else {
      lo = mid + 1;
    }
  }
  return ans;
}

int lastOccurrence(List<int> a, int x) {
  var lo = 0, hi = a.length - 1, ans = -1;
  while (lo <= hi) {
    final mid = lo + (hi - lo) ~/ 2;
    if (a[mid] == x) ans = mid;
    if (a[mid] <= x) {
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
  return ans;
}
