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
