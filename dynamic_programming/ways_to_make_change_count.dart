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

int countOrderedWays(int amount, List<int> coins) {
  final ways = List.filled(amount + 1, 0)..[0] = 1;
  for (var a = 1; a <= amount; a++) {
    for (final c in coins) {
      if (c <= a) ways[a] += ways[a - c];
    }
  }
  return ways[amount];
}

void main() {
  print('combinations of 5 from {1,2,5}: ${countWays(5, [1, 2, 5])}');
  print('sequences of 4 from {1,2,3}: ${countOrderedWays(4, [1, 2, 3])}');
  print('no way: ${countWays(3, [2])}');
}
