// Dutch national flag: sort a list containing only 0, 1 and 2 in one pass.
//
// Maintain three regions with pointers: everything before `lo` is 0,
// everything after `hi` is 2, and `mid` scans the unknown middle. A 0 is
// swapped to the front, a 2 to the back, a 1 is left in place.
//
// Complexity: O(n) time, O(1) space; one pass, unlike counting sort.

void _swap(List<int> a, int i, int j) {
  final t = a[i];
  a[i] = a[j];
  a[j] = t;
}
