// TF-IDF scores how important a word is to a document within a corpus:
// term frequency (how often it appears in the document) times inverse
// document frequency (rarer words across documents count for more).
import 'dart:math';

Map<String, double> termFrequency(List<String> doc) {
  final counts = <String, int>{};
  for (final w in doc) {
    counts.update(w, (v) => v + 1, ifAbsent: () => 1);
  }
  return {for (final e in counts.entries) e.key: e.value / doc.length};
}

Map<String, double> inverseDocFrequency(List<List<String>> docs) {
  final df = <String, int>{};
  for (final d in docs) {
    for (final w in d.toSet()) {
      df.update(w, (v) => v + 1, ifAbsent: () => 1);
    }
  }
  return {for (final e in df.entries) e.key: log(docs.length / e.value) + 1};
}

List<Map<String, double>> tfidf(List<List<String>> docs) {
  final idf = inverseDocFrequency(docs);
  return [
    for (final d in docs)
      {for (final e in termFrequency(d).entries) e.key: e.value * idf[e.key]!},
  ];
}

void main() {
  final docs = [
    'the cat sat on the mat'.split(' '),
    'the dog sat on the log'.split(' '),
    'cats and dogs are pets'.split(' '),
  ];
  final v = tfidf(docs);
  for (var i = 0; i < docs.length; i++) {
    final top =
        (v[i].entries.toList()..sort((a, b) => b.value.compareTo(a.value)))
            .take(2);
    print(
      'doc $i: ${top.map((e) => '${e.key}=${e.value.toStringAsFixed(2)}').join(', ')}',
    );
  }
}
