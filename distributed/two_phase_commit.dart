// Two-phase commit: a coordinator makes a set of participants either all
// commit or all abort. Phase 1: ask each to prepare and vote yes/no.
// Phase 2: if every vote is yes send commit, otherwise send abort.
class Participant {
  final String name;
  final bool canCommit;
  String state = 'init';
  Participant(this.name, this.canCommit);

  bool prepare() {
    state = canCommit ? 'prepared' : 'aborted';
    return canCommit;
  }

  void commit() => state = 'committed';
  void abort() => state = 'aborted';
}

bool twoPhaseCommit(List<Participant> ps) {
  final votes = [for (final p in ps) p.prepare()];
  final ok = votes.every((v) => v);
  for (final p in ps) {
    ok ? p.commit() : p.abort();
  }
  return ok;
}
