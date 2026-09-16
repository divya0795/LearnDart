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
