// Set matrix zeroes: if a cell is 0, set its entire row and column to 0,
// in place. Use the first row and first column as scratch flags to avoid
// extra memory, remembering separately whether they themselves held zeros.
void setZeroes(List<List<int>> m) {
  final rows = m.length, cols = m[0].length;
  final firstRowZero = m[0].contains(0);
  final firstColZero = m.any((r) => r[0] == 0);
  for (var r = 1; r < rows; r++) {
    for (var c = 1; c < cols; c++) {
      if (m[r][c] == 0) {
        m[r][0] = 0;
        m[0][c] = 0;
      }
    }
  }
  for (var r = 1; r < rows; r++) {
    for (var c = 1; c < cols; c++) {
      if (m[r][0] == 0 || m[0][c] == 0) m[r][c] = 0;
    }
  }
  if (firstRowZero) {
    for (var c = 0; c < cols; c++) {
      m[0][c] = 0;
    }
  }
  if (firstColZero) {
    for (var r = 0; r < rows; r++) {
      m[r][0] = 0;
    }
  }
}

void main() {
  final m = [
    [1, 1, 1],
    [1, 0, 1],
    [1, 1, 1],
  ];
  setZeroes(m);
  m.forEach(print);
}
