// Rotate an array right by k positions in place, without extra memory.
//
// Trick: reverse the whole array, then reverse the first k elements and
// the last n-k elements separately. Three reversals compose to a rotation.
// k is reduced mod n so rotating by more than the length still works.
//
// Complexity: O(n) time, O(1) extra space.

void _reverse(List<int> a, int i, int j) {
  while (i < j) {
    final t = a[i];
    a[i++] = a[j];
    a[j--] = t;
  }
}

void rotateRight(List<int> a, int k) {
  if (a.isEmpty) return;
  k %= a.length;
  _reverse(a, 0, a.length - 1);
  _reverse(a, 0, k - 1);
  _reverse(a, k, a.length - 1);
}

void rotateLeft(List<int> a, int k) {
  if (a.isEmpty) return;
  rotateRight(a, a.length - k % a.length);
}

void main() {
  final a = [1, 2, 3, 4, 5, 6, 7];
  rotateRight(a, 3);
  print('right 3: $a');
  rotateLeft(a, 3);
  print('left 3 (back): $a');
  rotateRight(a, 10);
  print('right 10 == right 3: $a');
}
