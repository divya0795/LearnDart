// Serialise a binary tree to a string and rebuild it. Pre-order with an
// explicit '#' for each missing child is unambiguous, so the exact shape
// is recovered.
class Node {
  final int val;
  Node? left, right;
  Node(this.val, [this.left, this.right]);
}

String serialize(Node? n) =>
    n == null ? '#' : '${n.val},${serialize(n.left)},${serialize(n.right)}';

Node? deserialize(String s) {
  final it = s.split(',').iterator;
  Node? go() {
    if (!it.moveNext() || it.current == '#') return null;
    final n = Node(int.parse(it.current));
    n.left = go();
    n.right = go();
    return n;
  }

  return go();
}
