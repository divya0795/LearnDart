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

int maxPathSum(Node? root) {
  var best = -1 << 31;
  int go(Node? n) {
    if (n == null) return 0;
    final l = go(n.left) > 0 ? go(n.left) : 0;
    final r = go(n.right) > 0 ? go(n.right) : 0;
    if (n.val + l + r > best) best = n.val + l + r;
    return n.val + (l > r ? l : r);
  }

  go(root);
  return best;
}

void main() {
  final t = Node(
    5,
    Node(4, Node(11, Node(7), Node(2))),
    Node(8, Node(13), Node(4, null, Node(1))),
  );
  print(allPaths(t));
  print(pathsWithSum(t, 22));
  print('max path sum: ${maxPathSum(t)}');
}
