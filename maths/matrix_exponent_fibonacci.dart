// Fibonacci in O(log n) by raising [[1,1],[1,0]] to the n-th power: the
// top-right entry of M^n is F(n). Exponentiation by squaring makes it fast.
typedef M = List<List<int>>;

M mul(M a, M b) => [
  [
    a[0][0] * b[0][0] + a[0][1] * b[1][0],
    a[0][0] * b[0][1] + a[0][1] * b[1][1],
  ],
  [
    a[1][0] * b[0][0] + a[1][1] * b[1][0],
    a[1][0] * b[0][1] + a[1][1] * b[1][1],
  ],
];
