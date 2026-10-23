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
