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
