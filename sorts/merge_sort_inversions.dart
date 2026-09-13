// An inversion is a pair i < j with a[i] > a[j]; the count measures how
// far a list is from sorted. Merge sort counts them for free: whenever an
// element of the right half is placed before remaining left elements, it
// forms an inversion with each of them. O(n log n).
int countInversions(List<int> a) {
  final tmp = List.filled(a.length, 0);
  int sort(int lo, int hi) {
    if (hi - lo < 2) return 0;
    final mid = (lo + hi) ~/ 2;
    var inv = sort(lo, mid) + sort(mid, hi);
    var i = lo, j = mid, k = lo;
    while (i < mid && j < hi) {
      if (a[i] <= a[j]) {
        tmp[k++] = a[i++];
      } else {
        tmp[k++] = a[j++];
        inv += mid - i;
      }
    }
    while (i < mid) {
      tmp[k++] = a[i++];
    }
    while (j < hi) {
      tmp[k++] = a[j++];
    }
    for (var x = lo; x < hi; x++) {
      a[x] = tmp[x];
    }
    return inv;
  }

  return sort(0, a.length);
}

int countInversionsBrute(List<int> a) {
  var n = 0;
  for (var i = 0; i < a.length; i++) {
    for (var j = i + 1; j < a.length; j++) {
      if (a[i] > a[j]) n++;
    }
  }
  return n;
}

void main() {
  final a = [8, 4, 2, 1];
  print('brute: ${countInversionsBrute(a)}');
  print('merge: ${countInversions([...a])}');
  print('sorted input: ${countInversions([1, 2, 3, 4])}');
}
