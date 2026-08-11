// Course schedule: can all courses be finished given prerequisite pairs
// (a requires b)? Equivalent to "is the dependency graph acyclic?".
// Kahn's algorithm repeatedly removes courses with no remaining
// prerequisites; if some courses can never be removed, there is a cycle.
List<int>? courseOrder(int n, List<(int, int)> prereqs) {
  final adj = List.generate(n, (_) => <int>[]);
  final indeg = List.filled(n, 0);
  for (final (a, b) in prereqs) {
    adj[b].add(a);
    indeg[a]++;
  }
  final q = [
    for (var i = 0; i < n; i++)
      if (indeg[i] == 0) i,
  ];
  final order = <int>[];
  while (q.isNotEmpty) {
    final c = q.removeAt(0);
    order.add(c);
    for (final nx in adj[c]) {
      if (--indeg[nx] == 0) q.add(nx);
    }
  }
  return order.length == n ? order : null;
}
