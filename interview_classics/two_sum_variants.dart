// Two Sum: indices of two numbers adding up to a target. A hash map of
// value -> index lets each element look up its complement in O(1).
List<int>? twoSum(List<int> a, int target) {
  final seen = <int, int>{};
  for (var i = 0; i < a.length; i++) {
    final j = seen[target - a[i]];
    if (j != null) return [j, i];
    seen[a[i]] = i;
  }
  return null;
}
