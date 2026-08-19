// 3Sum: all unique triplets that add up to zero. Sort the list; fix the
// first element and use two pointers (left, right) on the rest, moving
// inward based on whether the sum is too small or too large.
List<List<int>> threeSum(List<int> nums) {
  final a = [...nums]..sort();
  final out = <List<int>>[];
  for (var i = 0; i < a.length - 2; i++) {
    if (i > 0 && a[i] == a[i - 1]) continue;
    var l = i + 1, r = a.length - 1;
    while (l < r) {
      final s = a[i] + a[l] + a[r];
      if (s == 0) {
        out.add([a[i], a[l], a[r]]);
        while (l < r && a[l] == a[l + 1]) {
          l++;
        }
        while (l < r && a[r] == a[r - 1]) {
          r--;
        }
        l++;
        r--;
      } else if (s < 0) {
        l++;
      } else {
        r--;
      }
    }
  }
  return out;
}
