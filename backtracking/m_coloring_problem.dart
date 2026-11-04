// Graph colouring: can the vertices be coloured with at most m colours so
// that no two adjacent vertices share a colour?
//
// Assign colours vertex by vertex; a colour is allowed only if no
// already-coloured neighbour uses it. If a vertex has no allowed colour,
// backtrack and change an earlier choice.

bool _safe(List<List<int>> g, List<int> color, int v, int c) {
  for (final u in g[v]) {
    if (color[u] == c) return false;
  }
  return true;
}

List<int>? colorGraph(List<List<int>> g, int m) {
  final color = List.filled(g.length, -1);
  bool go(int v) {
    if (v == g.length) return true;
    for (var c = 0; c < m; c++) {
      if (_safe(g, color, v, c)) {
        color[v] = c;
        if (go(v + 1)) return true;
        color[v] = -1;
      }
    }
    return false;
  }

  return go(0) ? color : null;
}
