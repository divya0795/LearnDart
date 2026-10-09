// Tower of Hanoi: move n disks from peg `from` to peg `to` using a spare
// peg, never placing a larger disk on a smaller one.
//
// The recursive insight: to move n disks, first move the top n-1 disks out
// of the way (onto the spare), move the largest disk, then move the n-1
// disks back on top of it. That gives T(n) = 2*T(n-1) + 1 = 2^n - 1 moves,
// which is provably the minimum.
//
// Complexity: O(2^n) time and output, O(n) recursion depth.

List<(String, String)> hanoi(
  int n, [
  String from = 'A',
  String to = 'C',
  String spare = 'B',
]) {
  if (n == 0) return [];
  return [
    ...hanoi(n - 1, from, spare, to),
    (from, to),
    ...hanoi(n - 1, spare, to, from),
  ];
}
