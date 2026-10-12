// Bully leader election: when a node notices the leader is gone it sends
// an election message to all higher-numbered nodes. If none answers, it
// becomes leader; if one answers, that node takes over the election. The
// highest-numbered alive node always ends up as leader.
class Cluster {
  final Map<int, bool> alive; // id -> alive
  Cluster(this.alive);

  int? elect(int starter) {
    final higher = alive.keys.where((id) => id > starter && alive[id]!).toList()
      ..sort();
    if (higher.isEmpty) return alive[starter]! ? starter : null;
    return elect(higher.first);
  }
}

void main() {
  final c = Cluster({1: true, 2: true, 3: true, 4: true, 5: true});
  print('start from 2: leader ${c.elect(2)}');
  c.alive[5] = false;
  print('after 5 fails, from 1: leader ${c.elect(1)}');
  c.alive[4] = false;
  print('after 4 fails, from 2: leader ${c.elect(2)}');
}
