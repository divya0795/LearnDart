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
