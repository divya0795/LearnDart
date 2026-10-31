// Gossip (epidemic) protocol: each round every informed node tells one
// random peer. Information reaches all N nodes in about log2(N) rounds
// with no central coordinator, which is why systems like Cassandra use
// it for membership. Seeded randomness keeps the run reproducible.
import 'dart:math';

int roundsToSpread(int n, {int seed = 7}) {
  final rnd = Random(seed);
  final informed = {0};
  var rounds = 0;
  while (informed.length < n) {
    for (final _ in informed.toList()) {
      informed.add(rnd.nextInt(n));
    }
    rounds++;
  }
  return rounds;
}

void main() {
  for (final n in [8, 64, 512, 4096]) {
    print(
      'n=$n rounds=${roundsToSpread(n)} (log2 = ${(log(n) / ln2).toStringAsFixed(1)})',
    );
  }
}
