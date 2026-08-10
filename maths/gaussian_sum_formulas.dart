// Closed-form sums, each checked against a loop in the demo.
//   1 + 2 + ... + n       = n(n+1)/2
//   1^2 + ... + n^2       = n(n+1)(2n+1)/6
//   1^3 + ... + n^3       = (n(n+1)/2)^2
int sumToN(int n) => n * (n + 1) ~/ 2;
int sumSquares(int n) => n * (n + 1) * (2 * n + 1) ~/ 6;
int sumCubes(int n) => sumToN(n) * sumToN(n);

int arithmeticSum(int first, int diff, int terms) =>
    terms * (2 * first + (terms - 1) * diff) ~/ 2;

int geometricSum(int first, int ratio, int terms) {
  if (ratio == 1) return first * terms;
  var pow = 1;
  for (var i = 0; i < terms; i++) {
    pow *= ratio;
  }
  return first * (pow - 1) ~/ (ratio - 1);
}
