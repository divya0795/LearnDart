// Deep-copy a graph. A node holds a value and neighbours; cycles mean we
// must remember which originals already have a copy, otherwise the copy
// recurses forever. The map original -> clone does both jobs.
class Node {
  final int val;
  final List<Node> neighbors = [];
  Node(this.val);
}

Node cloneGraph(Node start) {
  final copies = <Node, Node>{};
  Node go(Node n) {
    final existing = copies[n];
    if (existing != null) return existing;
    final c = copies[n] = Node(n.val);
    for (final m in n.neighbors) {
      c.neighbors.add(go(m));
    }
    return c;
  }

  return go(start);
}

String describe(Node start) {
  final seen = <Node>{};
  final lines = <String>[];
  void go(Node n) {
    if (!seen.add(n)) return;
    lines.add('${n.val}: ${n.neighbors.map((m) => m.val).join(',')}');
    n.neighbors.forEach(go);
  }

  go(start);
  return lines.join(' | ');
}
