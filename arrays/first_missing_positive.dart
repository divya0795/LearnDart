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

void main() {
  print(firstMissingPositive([1, 2, 0]));
  print(firstMissingPositive([3, 4, -1, 1]));
  print(firstMissingPositive([7, 8, 9, 11, 12]));
  print(firstMissingPositive([1, 2, 3]));
}
