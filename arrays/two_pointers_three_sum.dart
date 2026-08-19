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

int threeSumClosest(List<int> nums, int target) {
  final a = [...nums]..sort();
  var best = a[0] + a[1] + a[2];
  for (var i = 0; i < a.length - 2; i++) {
    var l = i + 1, r = a.length - 1;
    while (l < r) {
      final s = a[i] + a[l] + a[r];
      if ((s - target).abs() < (best - target).abs()) best = s;
      if (s < target) {
        l++;
      } else if (s > target) {
        r--;
      } else {
        return s;
      }
    }
  }
  return best;
}

void main() {
  print(threeSum([-1, 0, 1, 2, -1, -4]));
  print(threeSum([0, 0, 0, 0]));
  print(threeSumClosest([-1, 2, 1, -4], 1));
}
