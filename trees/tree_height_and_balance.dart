// Height, diameter and balance of a binary tree, all from one postorder
// idea: compute each child's answer first, then combine.
class Node {
  Node? left, right;
  Node([this.left, this.right]);
}

int height(Node? n) =>
    n == null ? 0 : 1 + _max(height(n.left), height(n.right));

int _max(int a, int b) => a > b ? a : b;

int diameter(Node? root) {
  var best = 0;
  int go(Node? n) {
    if (n == null) return 0;
    final l = go(n.left), r = go(n.right);
    best = _max(best, l + r);
    return 1 + _max(l, r);
  }

  go(root);
  return best;
}

bool isBalanced(Node? root) {
  int go(Node? n) {
    if (n == null) return 0;
    final l = go(n.left);
    if (l < 0) return -1;
    final r = go(n.right);
    if (r < 0 || (l - r).abs() > 1) return -1;
    return 1 + _max(l, r);
  }

  return go(root) >= 0;
}

void main() {
  final balanced = Node(Node(Node(), Node()), Node());
  final skewed = Node(Node(Node(Node())));
  print(
    'balanced: height ${height(balanced)}, diameter ${diameter(balanced)}, ok ${isBalanced(balanced)}',
  );
  print(
    'skewed:   height ${height(skewed)}, diameter ${diameter(skewed)}, ok ${isBalanced(skewed)}',
  );
}
