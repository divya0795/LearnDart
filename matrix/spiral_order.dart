// Spiral order: read a matrix clockwise from the outside in. Maintain four
// boundaries (top, bottom, left, right) and shrink them after each side
// is walked.
List<int> spiral(List<List<int>> m) {
  if (m.isEmpty) return [];
  final out = <int>[];
  var top = 0, bottom = m.length - 1, left = 0, right = m[0].length - 1;
  while (top <= bottom && left <= right) {
    for (var c = left; c <= right; c++) {
      out.add(m[top][c]);
    }
    top++;
    for (var r = top; r <= bottom; r++) {
      out.add(m[r][right]);
    }
    right--;
    if (top <= bottom) {
      for (var c = right; c >= left; c--) {
        out.add(m[bottom][c]);
      }
      bottom--;
    }
    if (left <= right) {
      for (var r = bottom; r >= top; r--) {
        out.add(m[r][left]);
      }
      left++;
    }
  }
  return out;
}
