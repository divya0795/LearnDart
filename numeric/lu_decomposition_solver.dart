// LU decomposition (Doolittle): A = L * U where L is lower triangular
// with ones on its diagonal and U is upper triangular. Once factored,
// solving A x = b costs only two cheap triangular solves.
(List<List<double>>, List<List<double>>) luDecompose(List<List<double>> a) {
  final n = a.length;
  final l = List.generate(n, (i) => List.filled(n, 0.0)..[i] = 1.0);
  final u = [
    for (final r in a) [...r],
  ];
  for (var k = 0; k < n; k++) {
    for (var i = k + 1; i < n; i++) {
      l[i][k] = u[i][k] / u[k][k];
      for (var j = k; j < n; j++) {
        u[i][j] -= l[i][k] * u[k][j];
      }
    }
  }
  return (l, u);
}

List<double> solve(List<List<double>> a, List<double> b) {
  final (l, u) = luDecompose(a);
  final n = b.length;
  final y = List.filled(n, 0.0), x = List.filled(n, 0.0);
  for (var i = 0; i < n; i++) {
    y[i] =
        b[i] -
        [for (var j = 0; j < i; j++) l[i][j] * y[j]].fold(0.0, (s, v) => s + v);
  }
  for (var i = n - 1; i >= 0; i--) {
    final s = [for (var j = i + 1; j < n; j++) u[i][j] * x[j]]
        .fold(0.0, (s, v) => s + v);
    x[i] = (y[i] - s) / u[i][i];
  }
  return x;
}

void main() {
  print(
    solve(
      [
        [2, 1],
        [1, 3],
      ],
      [5, 10],
    ),
  );
  print(
    solve(
      [
        [4, 3, 0],
        [3, 4, -1],
        [0, -1, 4],
      ],
      [24, 30, -24],
    ),
  );
}
