// Lowest common ancestor (LCA) in a binary search tree: walk down from the
// root; if both targets are smaller go left, if both larger go right,
// otherwise the current node is where they split -- the LCA.
class Node {
  final int val;
  Node? left, right;
  Node(this.val, [this.left, this.right]);
}

Node? lcaBst(Node? root, int a, int b) {
  while (root != null) {
    if (a < root.val && b < root.val) {
      root = root.left;
    } else if (a > root.val && b > root.val) {
      root = root.right;
    } else {
      return root;
    }
  }
  return null;
}

Node? lca(Node? root, int a, int b) {
  if (root == null || root.val == a || root.val == b) return root;
  final l = lca(root.left, a, b), r = lca(root.right, a, b);
  if (l != null && r != null) return root;
  return l ?? r;
}

void main() {
  final t = Node(
    6,
    Node(2, Node(0), Node(4, Node(3), Node(5))),
    Node(8, Node(7), Node(9)),
  );
  print('bst lca(2,8) = ${lcaBst(t, 2, 8)!.val}');
  print('bst lca(3,5) = ${lcaBst(t, 3, 5)!.val}');
  print('tree lca(0,5) = ${lca(t, 0, 5)!.val}');
}
