// Valid Sudoku: no repeated digit in any row, column or 3x3 box. Use a
// set of "seen" keys that encode (kind, index, digit).
bool isValidSudoku(List<List<String>> b) {
  final seen = <String>{};
  for (var r = 0; r < 9; r++) {
    for (var c = 0; c < 9; c++) {
      final d = b[r][c];
      if (d == '.') continue;
      if (!seen.add('r$r$d') ||
          !seen.add('c$c$d') ||
          !seen.add('b${r ~/ 3}${c ~/ 3}$d'))
        return false;
    }
  }
  return true;
}
