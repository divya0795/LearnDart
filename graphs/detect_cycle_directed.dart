// Cycle detection in a directed graph with DFS and three colours: white
// (unvisited), grey (on the current DFS path), black (finished). Reaching
// a grey node means we found a back edge, i.e. a cycle.
bool hasCycle(List<List<int>> g) {
  final color = List.filled(g.length, 0);
  bool dfs(int u) {
    color[u] = 1;
    for (final v in g[u]) {
      if (color[v] == 1) return true;
      if (color[v] == 0 && dfs(v)) return true;
    }
    color[u] = 2;
    return false;
  }

  for (var i = 0; i < g.length; i++) {
    if (color[i] == 0 && dfs(i)) return true;
  }
  return false;
}
