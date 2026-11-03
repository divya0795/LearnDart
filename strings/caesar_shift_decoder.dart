// Break a Caesar cipher without the key by scoring each of the 26 possible
// shifts against English letter frequencies and picking the best fit.
//
// A correct decryption has many E, T, A letters; wrong shifts look
// uniform. The chi-squared distance to the English profile ranks shifts.
const _english = [
  8.2,
  1.5,
  2.8,
  4.3,
  12.7,
  2.2,
  2.0,
  6.1,
  7.0,
  0.15,
  0.77,
  4.0,
  2.4,
  6.7,
  7.5,
  1.9,
  0.095,
  6.0,
  6.3,
  9.1,
  2.8,
  0.98,
  2.4,
  0.15,
  2.0,
  0.074,
];

String shift(String s, int k) => String.fromCharCodes(
  s.codeUnits.map((u) {
    if (u >= 97 && u <= 122) return 97 + (u - 97 + k) % 26;
    if (u >= 65 && u <= 90) return 65 + (u - 65 + k) % 26;
    return u;
  }),
);

double score(String s) {
  final counts = List.filled(26, 0);
  var total = 0;
  for (final u in s.toLowerCase().codeUnits) {
    if (u >= 97 && u <= 122) {
      counts[u - 97]++;
      total++;
    }
  }
  if (total == 0) return double.infinity;
  var chi = 0.0;
  for (var i = 0; i < 26; i++) {
    final expected = total * _english[i] / 100;
    chi += (counts[i] - expected) * (counts[i] - expected) / expected;
  }
  return chi;
}
