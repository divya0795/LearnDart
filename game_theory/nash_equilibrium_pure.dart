// A pure Nash equilibrium is a pair of choices where neither player can
// do better by changing only their own choice. For a payoff matrix check
// every cell: is the row player's payoff the best in its column, and the
// column player's best in its row?
List<(int, int)> pureNash(List<List<(int, int)>> payoff) {
  final out = <(int, int)>[];
  for (var r = 0; r < payoff.length; r++) {
    for (var c = 0; c < payoff[0].length; c++) {
      final rowBest = [
        for (var rr = 0; rr < payoff.length; rr++) payoff[rr][c].$1,
      ].reduce((a, b) => a > b ? a : b);
      final colBest = [
        for (var cc = 0; cc < payoff[0].length; cc++) payoff[r][cc].$2,
      ].reduce((a, b) => a > b ? a : b);
      if (payoff[r][c].$1 == rowBest && payoff[r][c].$2 == colBest)
        out.add((r, c));
    }
  }
  return out;
}
