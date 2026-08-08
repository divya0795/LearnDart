// The four standard binary tree traversals. In-order visits left, node,
// right (sorted order for a BST); pre-order visits the node first;
// post-order visits it last; level-order goes row by row.
class TreeNode {
  final int val;
  TreeNode? left, right;
  TreeNode(this.val, [this.left, this.right]);
}

List<int> inorder(TreeNode? n) =>
    n == null ? [] : [...inorder(n.left), n.val, ...inorder(n.right)];
List<int> preorder(TreeNode? n) =>
    n == null ? [] : [n.val, ...preorder(n.left), ...preorder(n.right)];
List<int> postorder(TreeNode? n) =>
    n == null ? [] : [...postorder(n.left), ...postorder(n.right), n.val];

List<List<int>> levelOrder(TreeNode? root) {
  final out = <List<int>>[];
  var level = [if (root != null) root];
  while (level.isNotEmpty) {
    out.add([for (final n in level) n.val]);
    level = [
      for (final n in level) ...[
        if (n.left != null) n.left!,
        if (n.right != null) n.right!,
      ],
    ];
  }
  return out;
}

List<int> inorderIterative(TreeNode? root) {
  final out = <int>[], st = <TreeNode>[];
  var cur = root;
  while (cur != null || st.isNotEmpty) {
    while (cur != null) {
      st.add(cur);
      cur = cur.left;
    }
    cur = st.removeLast();
    out.add(cur.val);
    cur = cur.right;
  }
  return out;
}
