// Next permutation: rearrange a list into the next lexicographically
// greater arrangement, or the smallest if it is already the greatest.
//
// 1. Find the rightmost i with a[i] < a[i+1] (the "pivot").
// 2. Find the rightmost j with a[j] > a[i] and swap them.
// 3. Reverse everything after i, making the suffix as small as possible.
//
// Complexity: O(n) time, O(1) space.

bool nextPermutation(List<int> a) {
  var i = a.length - 2;
  while (i >= 0 && a[i] >= a[i + 1]) {
    i--;
  }
  if (i >= 0) {
    var j = a.length - 1;
    while (a[j] <= a[i]) {
      j--;
    }
    final t = a[i];
    a[i] = a[j];
    a[j] = t;
  }
  var l = i + 1, r = a.length - 1;
  while (l < r) {
    final t = a[l];
    a[l++] = a[r];
    a[r--] = t;
  }
  return i >= 0;
}

void main() {
  final a = [1, 2, 3];
  do {
    print(a);
  } while (nextPermutation(a));
  print('wrapped to $a');
}
