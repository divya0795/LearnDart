// Is this binary tree a valid binary search tree? Checking only each
// node against its children is not enough; every node must lie within the
// (low, high) bounds inherited from all of its ancestors.
class Node {
  final int val;
  Node? left, right;
  Node(this.val, [this.left, this.right]);
}

bool isValidBst(Node? n, [int? low, int? high]) {
  if (n == null) return true;
  if ((low != null && n.val <= low) || (high != null && n.val >= high))
    return false;
  return isValidBst(n.left, low, n.val) && isValidBst(n.right, n.val, high);
}
