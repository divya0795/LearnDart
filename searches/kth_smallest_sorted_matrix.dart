// k-th smallest element in a row- and column-sorted matrix: binary search
// the value range and count how many entries are <= the guess by walking
// the staircase from the bottom-left corner.
int countAtMost(List<List<int>> m, int x) {
  var count = 0, r = m.length - 1, c = 0;
  while (r >= 0 && c < m[0].length) {
    if (m[r][c] <= x) {
      count += r + 1;
      c++;
    } else {
      r--;
    }
  }
  return count;
}

int kthSmallest(List<List<int>> m, int k) {
  var lo = m.first.first, hi = m.last.last;
  while (lo < hi) {
    final mid = lo + (hi - lo) ~/ 2;
    if (countAtMost(m, mid) >= k) {
      hi = mid;
    } else {
      lo = mid + 1;
    }
  }
  return lo;
}

void main() {
  final m = [
    [1, 5, 9],
    [10, 11, 13],
    [12, 13, 15],
  ];
  for (final k in [1, 5, 8, 9]) {
    print('k=$k -> ${kthSmallest(m, k)}');
  }
}
