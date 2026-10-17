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
