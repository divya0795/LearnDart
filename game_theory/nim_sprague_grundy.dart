// Nim and the Sprague-Grundy theorem.
//
// In plain Nim (take any number of stones from one pile, last to move
// wins) the first player wins exactly when the XOR of the pile sizes is
// non-zero. Sprague-Grundy generalises this: any impartial game is
// equivalent to a Nim pile whose size is the game's Grundy number
//   grundy(s) = mex { grundy(t) : t reachable from s }
// and a sum of games is won by the first player iff the XOR is non-zero.
//
// Here the sub-game is "take 1, 3 or 4 stones from a pile".

int mex(Set<int> s) {
  var i = 0;
  while (s.contains(i)) i++;
  return i;
}

int grundy(int n, List<int> moves, Map<int, int> memo) {
  return memo[n] ??= mex({
    for (final m in moves)
      if (m <= n) grundy(n - m, moves, memo),
  });
}

bool firstPlayerWins(List<int> piles, List<int> moves) {
  final memo = <int, int>{};
  return piles.fold(0, (x, p) => x ^ grundy(p, moves, memo)) != 0;
}

void main() {
  print(
    'plain nim [3,4,5]: first wins = ${[3, 4, 5].fold(0, (a, b) => a ^ b) != 0}',
  );
  print(
    'plain nim [1,2,3]: first wins = ${[1, 2, 3].fold(0, (a, b) => a ^ b) != 0}',
  );
  final memo = <int, int>{};
  print(
    'grundy for take {1,3,4}: ${[
      for (var i = 0; i <= 10; i++) grundy(i, [1, 3, 4], memo),
    ]}',
  );
  print(
    'piles [5,7] with {1,3,4}: first wins = ${firstPlayerWins([5, 7], [1, 3, 4])}',
  );
}
