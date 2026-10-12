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
