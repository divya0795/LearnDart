// Count contiguous subarrays summing to k. With prefix sums, a subarray
// ending here sums to k exactly when an earlier prefix equals
// (current prefix - k). A hash map counts earlier prefixes: O(n).
int subarraySum(List<int> a, int k) {
  final seen = <int, int>{0: 1};
  var prefix = 0, count = 0;
  for (final x in a) {
    prefix += x;
    count += seen[prefix - k] ?? 0;
    seen[prefix] = (seen[prefix] ?? 0) + 1;
  }
  return count;
}

int longestSubarrayWithSum(List<int> a, int k) {
  final first = <int, int>{0: -1};
  var prefix = 0, best = 0;
  for (var i = 0; i < a.length; i++) {
    prefix += a[i];
    if (first.containsKey(prefix - k)) {
      final len = i - first[prefix - k]!;
      if (len > best) best = len;
    }
    first.putIfAbsent(prefix, () => i);
  }
  return best;
}
