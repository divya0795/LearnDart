// Problem 11 style: find the greatest product of four adjacent numbers
// in a grid, in any of four directions (right, down, and the two
// diagonals). A small grid is used here so the logic is easy to follow.
int maxAdjacentProduct(List<List<int>> g, {int n = 4}) {
  var best = 0;
  const dirs = [(0, 1), (1, 0), (1, 1), (1, -1)];
  for (var r = 0; r < g.length; r++) {
    for (var c = 0; c < g[0].length; c++) {
      for (final (dr, dc) in dirs) {
        final er = r + dr * (n - 1), ec = c + dc * (n - 1);
        if (er < 0 || er >= g.length || ec < 0 || ec >= g[0].length) continue;
        var p = 1;
        for (var k = 0; k < n; k++) {
          p *= g[r + dr * k][c + dc * k];
        }
        if (p > best) best = p;
      }
    }
  }
  return best;
}
