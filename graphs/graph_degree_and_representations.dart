// Convert between the three common graph representations and compute
// vertex degrees. Adjacency lists suit sparse graphs; a matrix gives O(1)
// edge lookup but O(V^2) memory.
List<List<int>> toAdjacencyList(
  int n,
  List<(int, int)> edges, {
  bool directed = false,
}) {
  final g = List.generate(n, (_) => <int>[]);
  for (final (u, v) in edges) {
    g[u].add(v);
    if (!directed) g[v].add(u);
  }
  return g;
}

List<List<int>> toMatrix(
  int n,
  List<(int, int)> edges, {
  bool directed = false,
}) {
  final m = List.generate(n, (_) => List.filled(n, 0));
  for (final (u, v) in edges) {
    m[u][v] = 1;
    if (!directed) m[v][u] = 1;
  }
  return m;
}

List<int> degrees(List<List<int>> g) => [for (final l in g) l.length];

bool handshakeHolds(List<List<int>> g, int edgeCount) =>
    degrees(g).fold(0, (a, b) => a + b) == 2 * edgeCount;

void main() {
  final edges = [(0, 1), (0, 2), (1, 2), (2, 3)];
  final g = toAdjacencyList(4, edges);
  print(g);
  toMatrix(4, edges).forEach(print);
  print(
    'degrees ${degrees(g)}, handshake ok: ${handshakeHolds(g, edges.length)}',
  );
}
