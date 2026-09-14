// Best time to buy and sell stock. One transaction: track the cheapest
// price so far and the best profit if we sold today.
int maxProfitOnce(List<int> prices) {
  var low = 1 << 30, best = 0;
  for (final p in prices) {
    if (p < low) low = p;
    if (p - low > best) best = p - low;
  }
  return best;
}

int maxProfitUnlimited(List<int> prices) {
  var profit = 0;
  for (var i = 1; i < prices.length; i++) {
    if (prices[i] > prices[i - 1]) profit += prices[i] - prices[i - 1];
  }
  return profit;
}

int maxProfitK(int k, List<int> prices) {
  if (prices.isEmpty) return 0;
  final buy = List.filled(k + 1, -(1 << 30)), sell = List.filled(k + 1, 0);
  for (final p in prices) {
    for (var t = 1; t <= k; t++) {
      if (sell[t - 1] - p > buy[t]) buy[t] = sell[t - 1] - p;
      if (buy[t] + p > sell[t]) sell[t] = buy[t] + p;
    }
  }
  return sell[k];
}

void main() {
  const p = [7, 1, 5, 3, 6, 4];
  print('once: ${maxProfitOnce(p)}');
  print('unlimited: ${maxProfitUnlimited(p)}');
  print('k=2: ${maxProfitK(2, [3, 3, 5, 0, 0, 3, 1, 4])}');
}
