// Merkle tree: leaves are hashes of data blocks and each parent is the
// hash of its two children, so the single root commits to all the data.
// Changing any block changes the root. The toy hash here is for
// illustration only.
int hash(String s) {
  var h = 0x811c9dc5;
  for (final c in s.codeUnits) {
    h = ((h ^ c) * 0x01000193) & 0xffffffff;
  }
  return h;
}

List<List<int>> buildTree(List<String> blocks) {
  var level = blocks.map(hash).toList();
  final levels = [level];
  while (level.length > 1) {
    final next = <int>[];
    for (var i = 0; i < level.length; i += 2) {
      final r = i + 1 < level.length ? level[i + 1] : level[i];
      next.add(hash('${level[i]}$r'));
    }
    levels.add(level = next);
  }
  return levels;
}

List<(int, bool)> proof(List<List<int>> levels, int index) {
  final p = <(int, bool)>[];
  for (var l = 0; l < levels.length - 1; l++) {
    final sib = index.isEven ? index + 1 : index - 1;
    p.add((
      sib < levels[l].length ? levels[l][sib] : levels[l][index],
      index.isEven,
    ));
    index ~/= 2;
  }
  return p;
}

bool verify(String block, List<(int, bool)> p, int root) {
  var h = hash(block);
  for (final (sib, isLeft) in p) {
    h = isLeft ? hash('$h$sib') : hash('$sib$h');
  }
  return h == root;
}
