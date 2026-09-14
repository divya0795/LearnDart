// Run-length encoding of a binary string: store the first bit and then
// the lengths of alternating runs. "0001100" becomes first=0, runs
// [3, 2, 2]. Great for long runs (fax images), useless for noise.
({String first, List<int> runs}) rleEncode(String bits) {
  final runs = <int>[];
  var i = 0;
  while (i < bits.length) {
    var j = i;
    while (j < bits.length && bits[j] == bits[i]) {
      j++;
    }
    runs.add(j - i);
    i = j;
  }
  return (first: bits.isEmpty ? '' : bits[0], runs: runs);
}

String rleDecode(String first, List<int> runs) {
  final b = StringBuffer();
  var bit = first;
  for (final r in runs) {
    b.write(bit * r);
    bit = bit == '0' ? '1' : '0';
  }
  return b.toString();
}
