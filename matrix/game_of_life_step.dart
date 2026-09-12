// One step of Conway's Game of Life on a bounded grid. Count a cell's
// live neighbours among its 8 surrounding cells.
int neighbours(List<List<int>> g, int r, int c) {
  var n = 0;
  for (var dr = -1; dr <= 1; dr++) {
    for (var dc = -1; dc <= 1; dc++) {
      if (dr == 0 && dc == 0) continue;
      final y = r + dr, x = c + dc;
      if (y >= 0 && x >= 0 && y < g.length && x < g[0].length) n += g[y][x];
    }
  }
  return n;
}

List<List<int>> step(List<List<int>> g) => [
  for (var r = 0; r < g.length; r++)
    [
      for (var c = 0; c < g[0].length; c++)
        switch ((g[r][c], neighbours(g, r, c))) {
          (1, 2) || (1, 3) => 1,
          (0, 3) => 1,
          _ => 0,
        },
    ],
];
