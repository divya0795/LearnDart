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

void main() {
  List<List<String>> empty() => List.generate(9, (_) => List.filled(9, '.'));
  final ok = empty()
    ..[0][0] = '5'
    ..[0][1] = '3'
    ..[1][0] = '6';
  print(isValidSudoku(ok));
  final badRow = empty()
    ..[0][0] = '5'
    ..[0][8] = '5';
  print(isValidSudoku(badRow));
  final badBox = empty()
    ..[0][0] = '7'
    ..[2][2] = '7';
  print(isValidSudoku(badBox));
}
