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

void main() {
  final n = List.generate(4, (i) => Node(i + 1));
  for (var i = 0; i < 4; i++) {
    n[i].neighbors.addAll([n[(i + 1) % 4], n[(i + 3) % 4]]);
  }
  final c = cloneGraph(n[0]);
  print(describe(n[0]));
  print(describe(c));
  print('distinct objects: ${!identical(n[0], c)}');
}
