// Two numbers appear once; all others appear exactly twice. Find the two.
//
// XOR of everything is a ^ b. Since a != b, some bit is set in it; that
// bit differs between a and b. Split the numbers by that bit and XOR each
// group: pairs cancel inside each group, leaving a in one and b in the
// other.
//
// Complexity: O(n) time, O(1) space.

(int, int) findTwoSingles(List<int> nums) {
  final xy = nums.fold(0, (s, v) => s ^ v);
  final bit = xy & -xy;
  var a = 0, b = 0;
  for (final v in nums) {
    if (v & bit != 0) {
      a ^= v;
    } else {
      b ^= v;
    }
  }
  return a < b ? (a, b) : (b, a);
}
