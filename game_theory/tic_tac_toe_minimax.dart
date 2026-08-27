// Perfect tic-tac-toe with minimax: X maximises, O minimises; a win scores
// +1/-1 and a draw 0. Searching the whole game tree shows optimal play
// always ends in a draw.
const _lines = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

String? winner(List<String> b) {
  for (final l in _lines) {
    if (b[l[0]] != ' ' && b[l[0]] == b[l[1]] && b[l[1]] == b[l[2]])
      return b[l[0]];
  }
  return null;
}

int minimax(List<String> b, bool xTurn) {
  final w = winner(b);
  if (w != null) return w == 'X' ? 1 : -1;
  if (!b.contains(' ')) return 0;
  var best = xTurn ? -2 : 2;
  for (var i = 0; i < 9; i++) {
    if (b[i] != ' ') continue;
    b[i] = xTurn ? 'X' : 'O';
    final s = minimax(b, !xTurn);
    b[i] = ' ';
    best = xTurn ? (s > best ? s : best) : (s < best ? s : best);
  }
  return best;
}

int bestMove(List<String> b, bool xTurn) {
  var bestScore = xTurn ? -2 : 2, move = -1;
  for (var i = 0; i < 9; i++) {
    if (b[i] != ' ') continue;
    b[i] = xTurn ? 'X' : 'O';
    final s = minimax(b, !xTurn);
    b[i] = ' ';
    if (xTurn ? s > bestScore : s < bestScore) {
      bestScore = s;
      move = i;
    }
  }
  return move;
}
