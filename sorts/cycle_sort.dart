// Cycle sort: an in-place sort that performs the minimum possible number
// of writes -- useful when writing is expensive (e.g. flash memory).
//
// For each element, count how many elements are smaller to find its final
// position, then rotate the cycle of displaced elements into place.

int cycleSort(List<int> a) {
  var writes = 0;
  for (var start = 0; start < a.length - 1; start++) {
    var item = a[start];
    var pos = start;
    for (var i = start + 1; i < a.length; i++) {
      if (a[i] < item) pos++;
    }
    if (pos == start) continue;
    while (item == a[pos]) {
      pos++;
    }
    var t = a[pos];
    a[pos] = item;
    item = t;
    writes++;
    while (pos != start) {
      pos = start;
      for (var i = start + 1; i < a.length; i++) {
        if (a[i] < item) pos++;
      }
      while (item == a[pos]) {
        pos++;
      }
      t = a[pos];
      a[pos] = item;
      item = t;
      writes++;
    }
  }
  return writes;
}

void main() {
  final a = [5, 2, 8, 2, 9, 1];
  final w = cycleSort(a);
  print('$a using $w writes');
}
