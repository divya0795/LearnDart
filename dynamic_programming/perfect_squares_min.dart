// Perfect squares: the fewest square numbers that add up to n. A coin
// change problem where the coins are 1, 4, 9, 16, ...:
// dp[i] = 1 + min(dp[i - k*k]).
int numSquares(int n) {
  final dp = List.filled(n + 1, 1 << 30)..[0] = 0;
  for (var i = 1; i <= n; i++) {
    for (var k = 1; k * k <= i; k++) {
      final c = dp[i - k * k] + 1;
      if (c < dp[i]) dp[i] = c;
    }
  }
  return dp[n];
}
