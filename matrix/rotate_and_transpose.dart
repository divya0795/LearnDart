// Rotate an n x n matrix 90 degrees clockwise in place: transpose it
// (swap across the diagonal) and then reverse each row.
void transpose(List<List<int>> m) {
  for (var i = 0; i < m.length; i++) {
    for (var j = i + 1; j < m.length; j++) {
      final t = m[i][j];
      m[i][j] = m[j][i];
      m[j][i] = t;
    }
  }
}

void rotateClockwise(List<List<int>> m) {
  transpose(m);
  for (final row in m) {
    for (var i = 0, j = row.length - 1; i < j; i++, j--) {
      final t = row[i];
      row[i] = row[j];
      row[j] = t;
    }
  }
}

void rotateCounterClockwise(List<List<int>> m) {
  transpose(m);
  for (var i = 0, j = m.length - 1; i < j; i++, j--) {
    final t = m[i];
    m[i] = m[j];
    m[j] = t;
  }
}
