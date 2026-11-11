// Row n of Pascal's triangle without recursion, using the identity
// C(n, k+1) = C(n, k) * (n - k) / (k + 1).
List<int> pascalRow(int n) {
  final row = <int>[1];
  for (var k = 0; k < n; k++) {
    row.add(row.last * (n - k) ~/ (k + 1));
  }
  return row;
}

List<List<int>> pascalTriangle(int rows) => [
  for (var n = 0; n < rows; n++) pascalRow(n),
];

bool rowSumsToPowerOfTwo(int n) =>
    pascalRow(n).fold(0, (a, b) => a + b) == 1 << n;
