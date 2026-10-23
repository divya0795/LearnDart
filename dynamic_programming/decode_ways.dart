// Decode ways: '1' -> A ... '26' -> Z. How many letter strings can a digit
// string decode to? Like climbing stairs, each position can take one
// digit (1-9) or two digits (10-26), so ways[i] = ways[i-1] (if valid)
// + ways[i-2] (if the pair is valid).
int numDecodings(String s) {
  if (s.isEmpty || s[0] == '0') return 0;
  var prev2 = 1, prev1 = 1;
  for (var i = 1; i < s.length; i++) {
    var cur = 0;
    if (s[i] != '0') cur += prev1;
    final two = int.parse(s.substring(i - 1, i + 1));
    if (two >= 10 && two <= 26) cur += prev2;
    prev2 = prev1;
    prev1 = cur;
  }
  return prev1;
}

void main() {
  for (final s in ['12', '226', '06', '10', '2101', '11106']) {
    print('"$s" -> ${numDecodings(s)}');
  }
}
