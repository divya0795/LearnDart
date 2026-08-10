// Closed-form sums, each checked against a loop in the demo.
//   1 + 2 + ... + n       = n(n+1)/2
//   1^2 + ... + n^2       = n(n+1)(2n+1)/6
//   1^3 + ... + n^3       = (n(n+1)/2)^2
int sumToN(int n) => n * (n + 1) ~/ 2;
int sumSquares(int n) => n * (n + 1) * (2 * n + 1) ~/ 6;
int sumCubes(int n) => sumToN(n) * sumToN(n);
