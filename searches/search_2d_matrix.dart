// Search a row-wise sorted matrix whose rows are also sorted end to start:
// the whole matrix, read row by row, is one sorted sequence. Binary search
// the flattened index and convert with row = i ~/ cols, col = i % cols.

bool searchMatrix(List<List<int>> m, int target) {
  if (m.isEmpty || m[0].isEmpty) return false;
  final cols = m[0].length;
  var lo = 0, hi = m.length * cols - 1;
  while (lo <= hi) {
    final mid = lo + (hi - lo) ~/ 2;
    final v = m[mid ~/ cols][mid % cols];
    if (v == target) return true;
    if (v < target) {
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
  return false;
}

bool searchStaircase(List<List<int>> m, int target) {
  var r = 0, c = m[0].length - 1;
  while (r < m.length && c >= 0) {
    if (m[r][c] == target) return true;
    if (m[r][c] > target) {
      c--;
    } else {
      r++;
    }
  }
  return false;
}
