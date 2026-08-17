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

void main() {
  final r = Random(1);
  final counts = List.filled(17, 0);
  const n = 100000;
  for (var i = 0; i < n; i++) {
    counts[randomLevel(r)]++;
  }
  for (var l = 1; l <= 8; l++) {
    print(
      'level $l: ${(counts[l] / n * 100).toStringAsFixed(1)}% (expected ${(100 / pow(2, l)).toStringAsFixed(1)}%)',
    );
  }
}
