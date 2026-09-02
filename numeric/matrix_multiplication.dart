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

List<List<double>> transpose(List<List<double>> m) => [
  for (var j = 0; j < m[0].length; j++) [for (final r in m) r[j]],
];

List<List<double>> identity(int n) => [
  for (var i = 0; i < n; i++) [for (var j = 0; j < n; j++) i == j ? 1.0 : 0.0],
];

void main() {
  final a = [
    [1.0, 2.0],
    [3.0, 4.0],
    [5.0, 6.0],
  ];
  print(multiply(a, transpose(a)));
  print(multiply(identity(3), a));
}
