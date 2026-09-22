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

void sortColors(List<int> a) {
  var lo = 0, mid = 0, hi = a.length - 1;
  while (mid <= hi) {
    switch (a[mid]) {
      case 0:
        _swap(a, lo++, mid++);
      case 1:
        mid++;
      default:
        _swap(a, mid, hi--);
    }
  }
}

void main() {
  final a = [2, 0, 2, 1, 1, 0, 2, 0, 1];
  sortColors(a);
  print(a);
}
