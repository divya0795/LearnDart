// Hamming distance counts the positions where two equal-length strings
// differ; Jaccard similarity compares the sets of words they contain.
int hamming(String a, String b) {
  if (a.length != b.length) throw ArgumentError('lengths differ');
  var d = 0;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) d++;
  }
  return d;
}

double jaccard(String a, String b) {
  final x = a.toLowerCase().split(RegExp(r'\W+')).toSet()..remove('');
  final y = b.toLowerCase().split(RegExp(r'\W+')).toSet()..remove('');
  if (x.isEmpty && y.isEmpty) return 1;
  return x.intersection(y).length / x.union(y).length;
}

void main() {
  print(hamming('karolin', 'kathrin'));
  print(hamming('1011101', '1001001'));
  print(jaccard('the quick brown fox', 'the lazy brown dog'));
  print(jaccard('same words', 'words same'));
}
