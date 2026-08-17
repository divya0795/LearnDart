// Shortest path in a grid maze (0 = open, 1 = wall) with breadth-first
// search. BFS explores cells in order of distance, so the first time it
// reaches the goal is via a shortest path.
List<(int, int)>? shortestPath(
  List<List<int>> maze,
  (int, int) start,
  (int, int) goal,
) {
  final prev = <(int, int), (int, int)?>{start: null};
  final q = [start];
  var head = 0;
  while (head < q.length) {
    final cur = q[head++];
    if (cur == goal) break;
    for (final (dy, dx) in [(1, 0), (-1, 0), (0, 1), (0, -1)]) {
      final n = (cur.$1 + dy, cur.$2 + dx);
      if (n.$1 < 0 || n.$2 < 0 || n.$1 >= maze.length || n.$2 >= maze[0].length)
        continue;
      if (maze[n.$1][n.$2] == 1 || prev.containsKey(n)) continue;
      prev[n] = cur;
      q.add(n);
    }
  }
  if (!prev.containsKey(goal)) return null;
  final path = <(int, int)>[];
  for ((int, int)? p = goal; p != null; p = prev[p]) {
    path.add(p);
  }
  return path.reversed.toList();
}

String render(List<List<int>> maze, List<(int, int)>? path) {
  final on = path?.toSet() ?? {};
  return [
    for (var r = 0; r < maze.length; r++)
      [
        for (var c = 0; c < maze[0].length; c++)
          maze[r][c] == 1 ? '#' : (on.contains((r, c)) ? '*' : '.'),
      ].join(),
  ].join('\n');
}

void main() {
  final maze = [
    [0, 0, 1, 0],
    [1, 0, 1, 0],
    [0, 0, 0, 0],
    [0, 1, 1, 0],
  ];
  final p = shortestPath(maze, (0, 0), (3, 3));
  print(render(maze, p));
  print('length: ${p!.length - 1} steps');
  print(
    'blocked: ${shortestPath([
      [0, 1],
      [1, 0],
    ], (0, 0), (1, 1))}',
  );
}
