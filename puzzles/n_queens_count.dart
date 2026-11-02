// Count the ways to place n non-attacking queens on an n x n board. Three
// bitmasks track columns and both diagonals under attack; the lowest free
// bit gives the next placement, so each row is processed in O(1) per
// candidate.
int countQueens(int n) {
  final all = (1 << n) - 1;
  int go(int cols, int d1, int d2) {
    if (cols == all) return 1;
    var count = 0;
    var free = all & ~(cols | d1 | d2);
    while (free != 0) {
      final bit = free & -free;
      free -= bit;
      count += go(cols | bit, ((d1 | bit) << 1) & all, (d2 | bit) >> 1);
    }
    return count;
  }

  return go(0, 0, 0);
}

void main() {
  for (var n = 1; n <= 9; n++) {
    print('n=$n -> ${countQueens(n)}');
  }
}
