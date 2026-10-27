// An inverted index maps each word to the documents containing it, which
// makes search fast: look up the words instead of scanning every document.
class InvertedIndex {
  final _index = <String, Set<int>>{};
  final List<String> docs;

  InvertedIndex(this.docs) {
    for (var i = 0; i < docs.length; i++) {
      for (final m in RegExp(r'[a-z0-9]+').allMatches(docs[i].toLowerCase())) {
        _index.putIfAbsent(m[0]!, () => {}).add(i);
      }
    }
  }

  Set<int> and(List<String> terms) => terms
      .map((t) => _index[t] ?? <int>{})
      .reduce((a, b) => a.intersection(b));

  Set<int> or(List<String> terms) =>
      terms.map((t) => _index[t] ?? <int>{}).reduce((a, b) => a.union(b));
}

void main() {
  final idx = InvertedIndex([
    'dart is fast',
    'dart and flutter build apps',
    'flutter is a ui toolkit',
    'rust is fast too',
  ]);
  print('dart AND fast: ${idx.and(['dart', 'fast'])}');
  print('fast OR flutter: ${idx.or(['fast', 'flutter'])}');
  print('missing: ${idx.and(['dart', 'python'])}');
}
