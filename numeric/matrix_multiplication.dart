// Matrix multiplication: C[i][j] = sum over k of A[i][k] * B[k][j].
// Requires cols(A) == rows(B). Naive cost is O(n^3).
List<List<double>> multiply(List<List<double>> a, List<List<double>> b) {
  if (a[0].length != b.length) throw ArgumentError('shape mismatch');
  return [
    for (var i = 0; i < a.length; i++)
      [
        for (var j = 0; j < b[0].length; j++)
          [for (var k = 0; k < b.length; k++) a[i][k] * b[k][j]]
              .fold(0.0, (s, v) => s + v),
      ],
  ];
}
