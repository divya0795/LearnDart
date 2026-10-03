// Problem 15: how many routes are there through a 20x20 grid from the top
// left to the bottom right, moving only right and down? Any route is 20
// rights and 20 downs in some order: C(40, 20).
int binomial(int n, int k) {
  var r = 1;
  for (var i = 1; i <= k; i++) {
    r = r * (n - k + i) ~/ i;
  }
  return r;
}
