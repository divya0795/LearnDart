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

List<int>? findCycle(List<List<int>> g) {
  final color = List.filled(g.length, 0), parent = List.filled(g.length, -1);
  List<int>? found;
  bool dfs(int u) {
    color[u] = 1;
    for (final v in g[u]) {
      if (color[v] == 1) {
        final cyc = [v];
        for (var x = u; x != v; x = parent[x]) {
          cyc.add(x);
        }
        found = cyc.reversed.toList();
        return true;
      }
      if (color[v] == 0) {
        parent[v] = u;
        if (dfs(v)) return true;
      }
    }
    color[u] = 2;
    return false;
  }

  for (var i = 0; i < g.length; i++) {
    if (color[i] == 0 && dfs(i)) return found;
  }
  return null;
}

void main() {
  print(
    hasCycle([
      [1],
      [2],
      [3],
      [],
    ]),
  );
  final List<List<int>> g = [
    [1],
    [2],
    [0, 3],
    [],
  ];
  print(hasCycle(g));
  print(findCycle(g));
}
