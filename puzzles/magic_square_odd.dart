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

bool isMagic(List<List<int>> m) {
  final n = m.length, target = n * (n * n + 1) ~/ 2;
  int sum(Iterable<int> xs) => xs.fold(0, (a, b) => a + b);
  return [for (var i = 0; i < n; i++) sum(m[i])].every((s) => s == target) &&
      [
        for (var j = 0; j < n; j++) sum([for (var i = 0; i < n; i++) m[i][j]]),
      ].every((s) => s == target) &&
      sum([for (var i = 0; i < n; i++) m[i][i]]) == target &&
      sum([for (var i = 0; i < n; i++) m[i][n - 1 - i]]) == target;
}

void main() {
  for (final n in [3, 5]) {
    final m = magicSquare(n);
    for (final row in m) {
      print(row.map((v) => v.toString().padLeft(3)).join());
    }
    print('magic: ${isMagic(m)}\n');
  }
}
