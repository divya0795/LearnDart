// Snapshot ("golden") testing: store the expected output once and compare
// future runs against it. Here the snapshot is kept in memory; real tools
// keep it in a file under version control.
class SnapshotStore {
  final _snaps = <String, String>{};

  String? check(String name, String actual) {
    final old = _snaps[name];
    if (old == null) {
      _snaps[name] = actual;
      return null; // recorded
    }
    return old == actual ? null : firstDifference(old, actual);
  }
}

String firstDifference(String a, String b) {
  final x = a.split('\n'), y = b.split('\n');
  for (var i = 0; i < x.length || i < y.length; i++) {
    final l = i < x.length ? x[i] : '<missing>',
        r = i < y.length ? y[i] : '<missing>';
    if (l != r) return 'line ${i + 1}: expected "$l" but got "$r"';
  }
  return 'identical';
}
