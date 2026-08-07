// Magic square: an n x n grid of 1..n^2 where every row, column and both
// diagonals add up to the same sum. For odd n the Siamese method places 1
// in the top middle and moves up-right each step, dropping down one cell
// when the target is occupied.
List<List<int>> magicSquare(int n) {
  if (n.isEven) throw ArgumentError('odd n only');
  final m = List.generate(n, (_) => List.filled(n, 0));
  var r = 0, c = n ~/ 2;
  for (var k = 1; k <= n * n; k++) {
    m[r][c] = k;
    final nr = (r - 1 + n) % n, nc = (c + 1) % n;
    if (m[nr][nc] != 0) {
      r = (r + 1) % n;
    } else {
      r = nr;
      c = nc;
    }
  }
  return m;
}
