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
