// Triangle minimum path: from the top, move to an adjacent number on the
// next row; minimise the total. Work bottom-up, replacing each entry with
// itself plus the smaller of its two children, so the answer is the top.
int minimumTotal(List<List<int>> tri) {
  final dp = [...tri.last];
  for (var r = tri.length - 2; r >= 0; r--) {
    for (var c = 0; c <= r; c++) {
      dp[c] = tri[r][c] + (dp[c] < dp[c + 1] ? dp[c] : dp[c + 1]);
    }
  }
  return dp[0];
}

List<int> minimumPath(List<List<int>> tri) {
  final n = tri.length;
  final best = [
    for (final r in tri) [...r],
  ];
  for (var r = n - 2; r >= 0; r--) {
    for (var c = 0; c <= r; c++) {
      best[r][c] += best[r + 1][c] < best[r + 1][c + 1]
          ? best[r + 1][c]
          : best[r + 1][c + 1];
    }
  }
  final path = [tri[0][0]];
  var c = 0;
  for (var r = 1; r < n; r++) {
    if (best[r][c + 1] < best[r][c]) c++;
    path.add(tri[r][c]);
  }
  return path;
}

void main() {
  final t = [
    [2],
    [3, 4],
    [6, 5, 7],
    [4, 1, 8, 3],
  ];
  print(minimumTotal(t));
  print(minimumPath(t));
}
