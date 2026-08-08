// Unique permutations of a list that may contain repeated values.
//
// Sort the input so equal values are adjacent, then build permutations by
// choosing an unused element at each level. To avoid emitting the same
// permutation twice, skip an element equal to its left neighbour unless
// that neighbour is already in use on the current path.
//
// Complexity: O(n * n!) worst case.

List<List<int>> permuteUnique(List<int> nums) {
  final a = [...nums]..sort();
  final used = List.filled(a.length, false);
  final path = <int>[], out = <List<int>>[];
  void go() {
    if (path.length == a.length) {
      out.add([...path]);
      return;
    }
    for (var i = 0; i < a.length; i++) {
      if (used[i]) continue;
      if (i > 0 && a[i] == a[i - 1] && !used[i - 1]) continue;
      used[i] = true;
      path.add(a[i]);
      go();
      path.removeLast();
      used[i] = false;
    }
  }

  go();
  return out;
}
