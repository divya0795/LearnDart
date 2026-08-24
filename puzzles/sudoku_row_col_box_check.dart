// Sudoku placement rule: a digit may go in a cell only if it does not
// already appear in that row, that column or that 3x3 box.
bool canPlace(List<List<int>> b, int r, int c, int d) {
  for (var i = 0; i < 9; i++) {
    if (b[r][i] == d || b[i][c] == d) return false;
  }
  final br = r ~/ 3 * 3, bc = c ~/ 3 * 3;
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      if (b[br + i][bc + j] == d) return false;
    }
  }
  return true;
}

List<int> candidates(List<List<int>> b, int r, int c) => b[r][c] != 0
    ? []
    : [
        for (var d = 1; d <= 9; d++)
          if (canPlace(b, r, c, d)) d,
      ];

void main() {
  final b = List.generate(9, (_) => List.filled(9, 0));
  b[0][0] = 5;
  b[0][4] = 3;
  b[4][0] = 7;
  b[1][1] = 9;
  print('(0,1): ${candidates(b, 0, 1)}');
  print('(2,2): ${candidates(b, 2, 2)}');
  print('5 at (8,0) legal: ${canPlace(b, 8, 0, 5)}');
}
