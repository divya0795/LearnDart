// Iterated prisoner's dilemma: each round both players Cooperate or
// Defect. Payoffs: both cooperate 3/3, both defect 1/1, defector gets 5
// while the cooperator gets 0. Strategies see the opponent's history.
typedef Strategy = bool Function(
  List<bool> mine,
  List<bool> theirs,
); // true = cooperate

bool titForTat(List<bool> mine, List<bool> theirs) =>
    theirs.isEmpty || theirs.last;
bool alwaysDefect(List<bool> mine, List<bool> theirs) => false;
bool alwaysCooperate(List<bool> mine, List<bool> theirs) => true;
bool grudger(List<bool> mine, List<bool> theirs) => !theirs.contains(false);

(int, int) play(Strategy a, Strategy b, int rounds) {
  final ha = <bool>[], hb = <bool>[];
  var sa = 0, sb = 0;
  for (var i = 0; i < rounds; i++) {
    final x = a(ha, hb), y = b(hb, ha);
    ha.add(x);
    hb.add(y);
    if (x && y) {
      sa += 3;
      sb += 3;
    } else if (x) {
      sb += 5;
    } else if (y) {
      sa += 5;
    } else {
      sa += 1;
      sb += 1;
    }
  }
  return (sa, sb);
}

void main() {
  final players = {
    'tit-for-tat': titForTat,
    'always-defect': alwaysDefect,
    'always-cooperate': alwaysCooperate,
    'grudger': grudger,
  };
  final totals = {for (final n in players.keys) n: 0};
  for (final a in players.entries) {
    for (final b in players.entries) {
      if (a.key == b.key) continue;
      totals[a.key] = totals[a.key]! + play(a.value, b.value, 100).$1;
    }
  }
  final ranked = totals.entries.toList()
    ..sort((x, y) => y.value.compareTo(x.value));
  for (final e in ranked) {
    print('${e.key.padRight(18)} ${e.value}');
  }
}
