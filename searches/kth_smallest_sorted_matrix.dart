// k-th smallest element in a row- and column-sorted matrix: binary search
// the value range and count how many entries are <= the guess by walking
// the staircase from the bottom-left corner.
int countAtMost(List<List<int>> m, int x) {
  var count = 0, r = m.length - 1, c = 0;
  while (r >= 0 && c < m[0].length) {
    if (m[r][c] <= x) {
      count += r + 1;
      c++;
    } else {
      r--;
    }
  }
  return count;
}
