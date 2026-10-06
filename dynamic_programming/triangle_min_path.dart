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
