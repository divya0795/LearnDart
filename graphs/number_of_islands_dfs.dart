// Number of islands: count groups of 1s connected up/down/left/right in a
// grid. Scan every cell; each unvisited land cell starts a new island,
// and a flood fill marks all cells of that island as visited.
int numIslands(List<List<int>> grid) {
  final g = [
    for (final r in grid) [...r],
  ];
  void fill(int r, int c) {
    if (r < 0 || c < 0 || r >= g.length || c >= g[0].length || g[r][c] != 1)
      return;
    g[r][c] = 2;
    fill(r + 1, c);
    fill(r - 1, c);
    fill(r, c + 1);
    fill(r, c - 1);
  }

  var count = 0;
  for (var r = 0; r < g.length; r++) {
    for (var c = 0; c < g[0].length; c++) {
      if (g[r][c] == 1) {
        count++;
        fill(r, c);
      }
    }
  }
  return count;
}

int numIslandsBfs(List<List<int>> grid) {
  final seen = [for (final r in grid) List.filled(r.length, false)];
  var count = 0;
  for (var r = 0; r < grid.length; r++) {
    for (var c = 0; c < grid[0].length; c++) {
      if (grid[r][c] != 1 || seen[r][c]) continue;
      count++;
      final q = [(r, c)];
      seen[r][c] = true;
      while (q.isNotEmpty) {
        final (y, x) = q.removeLast();
        for (final (dy, dx) in [(1, 0), (-1, 0), (0, 1), (0, -1)]) {
          final ny = y + dy, nx = x + dx;
          if (ny >= 0 &&
              nx >= 0 &&
              ny < grid.length &&
              nx < grid[0].length &&
              grid[ny][nx] == 1 &&
              !seen[ny][nx]) {
            seen[ny][nx] = true;
            q.add((ny, nx));
          }
        }
      }
    }
  }
  return count;
}

void main() {
  final grid = [
    [1, 1, 0, 0, 0],
    [1, 1, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 1, 1],
  ];
  print('dfs: ${numIslands(grid)}, bfs: ${numIslandsBfs(grid)}');
}
