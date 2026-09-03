// Minimum arrows to burst balloons. Each balloon spans [start, end] on the
// x-axis; an arrow at x bursts every balloon with start <= x <= end.
//
// Greedy: sort by end; shoot at the end of the first balloon, which pops
// every balloon overlapping that point; skip those and repeat.

int minArrows(List<(int, int)> balloons) {
  if (balloons.isEmpty) return 0;
  final s = [...balloons]..sort((a, b) => a.$2.compareTo(b.$2));
  var arrows = 1, pos = s.first.$2;
  for (final (a, b) in s.skip(1)) {
    if (a > pos) {
      arrows++;
      pos = b;
    }
  }
  return arrows;
}
