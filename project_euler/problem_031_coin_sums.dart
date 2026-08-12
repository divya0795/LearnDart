// Problem 31: how many ways can 2 pounds (200p) be made from the coins
// 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p? A classic unbounded
// combination-counting DP.
int ways(int target, List<int> coins) {
  final dp = List.filled(target + 1, 0)..[0] = 1;
  for (final c in coins) {
    for (var a = c; a <= target; a++) {
      dp[a] += dp[a - c];
    }
  }
  return dp[target];
}

void main() {
  print('5p with [1,2,5]: ${ways(5, [1, 2, 5])}');
  print('200p: ${ways(200, [1, 2, 5, 10, 20, 50, 100, 200])}');
}
