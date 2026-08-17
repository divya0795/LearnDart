// A skip list's speed comes from random level assignment: each element
// is promoted to the next level with probability p (typically 1/2). The
// expected number of levels is log(n) and the expected cost of a search
// is O(log n). This demo measures the level distribution.
import 'dart:math';

int randomLevel(Random r, {double p = 0.5, int maxLevel = 16}) {
  var level = 1;
  while (r.nextDouble() < p && level < maxLevel) {
    level++;
  }
  return level;
}
