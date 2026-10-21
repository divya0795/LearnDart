// Word ladder: change one letter at a time, each intermediate word must be
// in the dictionary; find the shortest chain from begin to end. Words are
// graph nodes, edges join words one letter apart, and BFS finds the
// shortest chain.
int ladderLength(String begin, String end, List<String> words) {
  final dict = words.toSet();
  if (!dict.contains(end)) return 0;
  var frontier = [begin];
  final seen = {begin};
  var steps = 1;
  while (frontier.isNotEmpty) {
    final next = <String>[];
    for (final w in frontier) {
      if (w == end) return steps;
      for (var i = 0; i < w.length; i++) {
        for (var c = 97; c <= 122; c++) {
          final cand =
              w.substring(0, i) + String.fromCharCode(c) + w.substring(i + 1);
          if (dict.contains(cand) && seen.add(cand)) next.add(cand);
        }
      }
    }
    frontier = next;
    steps++;
  }
  return 0;
}

void main() {
  const dict = ['hot', 'dot', 'dog', 'lot', 'log', 'cog'];
  print(ladderLength('hit', 'cog', dict));
  print(ladderLength('hit', 'cog', ['hot', 'dot', 'dog', 'lot', 'log']));
}
