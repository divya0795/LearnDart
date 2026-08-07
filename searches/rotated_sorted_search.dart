// Search in a rotated sorted array, e.g. [4,5,6,7,0,1,2].
//
// At any midpoint at least one half is sorted. Check whether the target
// lies inside the sorted half and discard the other half accordingly.
//
// Complexity: O(log n) for distinct values.

int searchRotated(List<int> a, int target) {
  var lo = 0, hi = a.length - 1;
  while (lo <= hi) {
    final mid = lo + (hi - lo) ~/ 2;
    if (a[mid] == target) return mid;
    if (a[lo] <= a[mid]) {
      if (target >= a[lo] && target < a[mid]) {
        hi = mid - 1;
      } else {
        lo = mid + 1;
      }
    } else {
      if (target > a[mid] && target <= a[hi]) {
        lo = mid + 1;
      } else {
        hi = mid - 1;
      }
    }
  }
  return -1;
}
