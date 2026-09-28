// Dijkstra's algorithm on a weighted graph with non-negative edges:
// repeatedly settle the closest unsettled vertex and relax its edges.
// This version records the predecessor of every vertex so the actual path
// can be rebuilt.
typedef Edge = (int to, int w);

({List<int> dist, List<int> prev}) dijkstra(List<List<Edge>> g, int src) {
  const inf = 1 << 60;
  final dist = List.filled(g.length, inf)..[src] = 0;
  final prev = List.filled(g.length, -1);
  final done = List.filled(g.length, false);
  for (var i = 0; i < g.length; i++) {
    var u = -1;
    for (var v = 0; v < g.length; v++) {
      if (!done[v] && (u == -1 || dist[v] < dist[u])) u = v;
    }
    if (u == -1 || dist[u] == inf) break;
    done[u] = true;
    for (final (v, w) in g[u]) {
      if (dist[u] + w < dist[v]) {
        dist[v] = dist[u] + w;
        prev[v] = u;
      }
    }
  }
  return (dist: dist, prev: prev);
}

List<int> pathTo(List<int> prev, int target) {
  final p = <int>[];
  for (var v = target; v != -1; v = prev[v]) {
    p.add(v);
  }
  return p.reversed.toList();
}
