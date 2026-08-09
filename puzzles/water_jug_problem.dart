// Water jug puzzle: with jugs of capacity a and b, can you measure exactly
// t litres? States are (water in jug A, water in jug B); moves are fill,
// empty or pour. BFS finds the fewest steps. A target is reachable only if
// it is a multiple of gcd(a, b) and not larger than max(a, b).
List<String>? solveJugs(int a, int b, int target) {
  final start = (0, 0);
  final prev = <(int, int), ((int, int), String)?>{start: null};
  final q = [start];
  var head = 0;
  while (head < q.length) {
    final (x, y) = q[head++];
    if (x == target || y == target) {
      final steps = <String>[];
      for (var s = (x, y); prev[s] != null; s = prev[s]!.$1) {
        steps.add('${prev[s]!.$2} -> $s');
      }
      return steps.reversed.toList();
    }
    final pourAB = x < b - y ? x : b - y;
    final pourBA = y < a - x ? y : a - x;
    final moves = <String, (int, int)>{
      'fill A': (a, y),
      'fill B': (x, b),
      'empty A': (0, y),
      'empty B': (x, 0),
      'pour A->B': (x - pourAB, y + pourAB),
      'pour B->A': (x + pourBA, y - pourBA),
    };
    for (final e in moves.entries) {
      if (!prev.containsKey(e.value)) {
        prev[e.value] = ((x, y), e.key);
        q.add(e.value);
      }
    }
  }
  return null;
}
