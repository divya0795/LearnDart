// Problem 28: in an n x n spiral (n odd) built clockwise from the centre,
// what is the sum of both diagonals? Ring k has corners spaced 2k apart,
// so each ring adds four terms of an arithmetic pattern; no grid needed.
int spiralDiagonalSum(int n) {
  var sum = 1, current = 1;
  for (var step = 2; step < n; step += 2) {
    for (var i = 0; i < 4; i++) {
      current += step;
      sum += current;
    }
  }
  return sum;
}
