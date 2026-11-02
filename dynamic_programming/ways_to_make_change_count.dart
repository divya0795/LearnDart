// Coin change (counting): how many different combinations of coins sum to
// the amount? Loop over coins on the outside so each combination is
// counted once, regardless of order.
int countWays(int amount, List<int> coins) {
  final ways = List.filled(amount + 1, 0)..[0] = 1;
  for (final c in coins) {
    for (var a = c; a <= amount; a++) {
      ways[a] += ways[a - c];
    }
  }
  return ways[amount];
}
