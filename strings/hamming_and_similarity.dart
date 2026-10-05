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
