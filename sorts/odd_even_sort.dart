// Odd-even (brick) sort: repeat two phases until no swap happens. In the
// even phase compare pairs (0,1),(2,3),...; in the odd phase compare
// (1,2),(3,4),.... Pairs within a phase are independent, which makes the
// algorithm easy to parallelise.

void oddEvenSort(List<int> a) {
  var sorted = false;
  while (!sorted) {
    sorted = true;
    for (var start = 0; start <= 1; start++) {
      for (var i = start; i + 1 < a.length; i += 2) {
        if (a[i] > a[i + 1]) {
          final t = a[i];
          a[i] = a[i + 1];
          a[i + 1] = t;
          sorted = false;
        }
      }
    }
  }
}
