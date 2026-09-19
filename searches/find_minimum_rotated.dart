// Minimum of a rotated sorted list with possible duplicates.
//
// Compare the midpoint with the right end: if mid > right the minimum is
// to the right; if mid < right it is at mid or to its left; if they are
// equal we cannot tell, so shrink the right end by one.

int findMin(List<int> a) {
  var lo = 0, hi = a.length - 1;
  while (lo < hi) {
    final mid = lo + (hi - lo) ~/ 2;
    if (a[mid] > a[hi]) {
      lo = mid + 1;
    } else if (a[mid] < a[hi]) {
      hi = mid;
    } else {
      hi--;
    }
  }
  return a[lo];
}

void main() {
  print(findMin([3, 4, 5, 1, 2]));
  print(findMin([2, 2, 2, 0, 1, 2]));
  print(findMin([1, 1, 1]));
}
