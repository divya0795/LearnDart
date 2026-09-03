// Boruvka's MST algorithm: in each round every component selects its
// cheapest outgoing edge, and all selected edges are added at once. The
// number of components at least halves each round, so there are O(log n)
// rounds. It is the basis of several parallel MST algorithms.
typedef WEdge = (int u, int v, int w);

int boruvka(int n, List<WEdge> edges) {
  final parent = List.generate(n, (i) => i);
  int find(int x) {
    while (parent[x] != x) {
      parent[x] = parent[parent[x]];
      x = parent[x];
    }
    return x;
  }

  var components = n, total = 0;
  while (components > 1) {
    final cheapest = List<WEdge?>.filled(n, null);
    for (final e in edges) {
      final a = find(e.$1), b = find(e.$2);
      if (a == b) continue;
      if (cheapest[a] == null || e.$3 < cheapest[a]!.$3) cheapest[a] = e;
      if (cheapest[b] == null || e.$3 < cheapest[b]!.$3) cheapest[b] = e;
    }
    var merged = false;
    for (final e in cheapest) {
      if (e == null) continue;
      final a = find(e.$1), b = find(e.$2);
      if (a != b) {
        parent[a] = b;
        total += e.$3;
        components--;
        merged = true;
      }
    }
    if (!merged) break;
  }
  return total;
}

void main() {
  final edges = [(0, 1, 10), (0, 2, 6), (0, 3, 5), (1, 3, 15), (2, 3, 4)];
  print('MST weight: ${boruvka(4, edges)}');
}
