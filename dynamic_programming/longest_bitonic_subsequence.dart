// Longest bitonic subsequence: strictly increasing then strictly
// decreasing. Compute the longest increasing subsequence ending at each
// index (lis) and the longest decreasing one starting there (lds); the
// answer is max(lis[i] + lds[i] - 1).
List<int> lisEndingAt(List<int> a) {
  final lis = List.filled(a.length, 1);
  for (var i = 1; i < a.length; i++) {
    for (var j = 0; j < i; j++) {
      if (a[j] < a[i] && lis[j] + 1 > lis[i]) lis[i] = lis[j] + 1;
    }
  }
  return lis;
}

int longestBitonic(List<int> a) {
  final lis = lisEndingAt(a);
  final lds = lisEndingAt(a.reversed.toList()).reversed.toList();
  var best = 0;
  for (var i = 0; i < a.length; i++) {
    if (lis[i] + lds[i] - 1 > best) best = lis[i] + lds[i] - 1;
  }
  return best;
}
