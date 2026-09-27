// Remove duplicates from a sorted list in place and return the new length.
//
// Because equal values are adjacent, a slow pointer marks the end of the
// unique prefix and a fast pointer scans ahead. Whenever the fast element
// differs from the last unique one, copy it just past the prefix.
//
// Complexity: O(n) time, O(1) space.

int removeDuplicates(List<int> a) {
  if (a.isEmpty) return 0;
  var slow = 0;
  for (var fast = 1; fast < a.length; fast++) {
    if (a[fast] != a[slow]) a[++slow] = a[fast];
  }
  return slow + 1;
}

int removeDuplicatesAtMostTwo(List<int> a) {
  var k = 0;
  for (final x in a) {
    if (k < 2 || x != a[k - 2]) a[k++] = x;
  }
  return k;
}

void main() {
  final a = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
  final n = removeDuplicates(a);
  print('unique: ${a.sublist(0, n)}');
  final b = [1, 1, 1, 2, 2, 3];
  final m = removeDuplicatesAtMostTwo(b);
  print('at most twice: ${b.sublist(0, m)}');
}
