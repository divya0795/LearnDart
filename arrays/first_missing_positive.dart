// First missing positive integer in O(n) time and O(1) space. Use the
// list itself as a hash table: put value v at index v-1 by swapping, for
// every v in 1..n. The first index i where a[i] != i+1 gives the answer.
int firstMissingPositive(List<int> nums) {
  final a = [...nums];
  final n = a.length;
  for (var i = 0; i < n; i++) {
    while (a[i] > 0 && a[i] <= n && a[a[i] - 1] != a[i]) {
      final j = a[i] - 1;
      final t = a[j];
      a[j] = a[i];
      a[i] = t;
    }
  }
  for (var i = 0; i < n; i++) {
    if (a[i] != i + 1) return i + 1;
  }
  return n + 1;
}
