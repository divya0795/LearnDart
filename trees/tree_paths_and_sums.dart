// Root-to-leaf paths and path sums via depth-first search carrying the
// current path.
class Node {
  final int val;
  Node? left, right;
  Node(this.val, [this.left, this.right]);
}

List<List<int>> allPaths(Node? root) {
  final out = <List<int>>[];
  void go(Node? n, List<int> path) {
    if (n == null) return;
    path.add(n.val);
    if (n.left == null && n.right == null) {
      out.add([...path]);
    } else {
      go(n.left, path);
      go(n.right, path);
    }
    path.removeLast();
  }

  go(root, []);
  return out;
}

List<List<int>> pathsWithSum(Node? root, int target) =>
    allPaths(root).where((p) => p.fold(0, (a, b) => a + b) == target).toList();
