// Problem 18: find the maximum total from top to bottom of a triangle,
// moving to adjacent numbers on the row below. Work bottom-up, replacing
// each entry with itself plus the larger of its two children.
int maxPathSum(List<List<int>> tri) {
  final dp = [...tri.last];
  for (var r = tri.length - 2; r >= 0; r--) {
    for (var c = 0; c <= r; c++) {
      dp[c] = tri[r][c] + (dp[c] > dp[c + 1] ? dp[c] : dp[c + 1]);
    }
  }
  return dp[0];
}
