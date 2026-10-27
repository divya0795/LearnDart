// Quickselect: find the k-th smallest element in O(n) average time by
// partitioning like quicksort but recursing into only one side.
int _partition(List<int> a, int lo, int hi) {
  final pivot = a[hi];
  var i = lo;
  for (var j = lo; j < hi; j++) {
    if (a[j] < pivot) {
      final t = a[i];
      a[i] = a[j];
      a[j] = t;
      i++;
    }
  }
  final t = a[i];
  a[i] = a[hi];
  a[hi] = t;
  return i;
}

int quickselect(List<int> a, int k) {
  final xs = [...a];
  var lo = 0, hi = xs.length - 1;
  while (true) {
    final p = _partition(xs, lo, hi);
    if (p == k) return xs[p];
    if (p < k) {
      lo = p + 1;
    } else {
      hi = p - 1;
    }
  }
}

double median(List<int> a) {
  final n = a.length;
  return n.isOdd
      ? quickselect(a, n ~/ 2).toDouble()
      : (quickselect(a, n ~/ 2 - 1) + quickselect(a, n ~/ 2)) / 2;
}

void main() {
  final a = [7, 10, 4, 3, 20, 15];
  print('3rd smallest: ${quickselect(a, 2)}');
  print('median: ${median(a)}');
  print('check: ${([...a]..sort())}');
}
