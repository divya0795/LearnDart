// Problem 15: how many routes are there through a 20x20 grid from the top
// left to the bottom right, moving only right and down? Any route is 20
// rights and 20 downs in some order: C(40, 20).
int binomial(int n, int k) {
  var r = 1;
  for (var i = 1; i <= k; i++) {
    r = r * (n - k + i) ~/ i;
  }
  return r;
}

int latticePathsDp(int n) {
  final dp = List.generate(n + 1, (_) => List.filled(n + 1, 1));
  for (var i = 1; i <= n; i++) {
    for (var j = 1; j <= n; j++) {
      dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
    }
  }
  return dp[n][n];
}

void main() {
  print('2x2: ${binomial(4, 2)}');
  print('20x20: ${binomial(40, 20)} (dp: ${latticePathsDp(20)})');
}
