// One-time pad: XOR the message with a truly random key as long as the
// message, used once. Every plaintext of that length is equally likely
// given the ciphertext, so it is information-theoretically secure.
//
// It fails badly if a key is reused: c1 ^ c2 = m1 ^ m2 leaks both.
import 'dart:convert';
import 'dart:math';

List<int> randomKey(int n) {
  final r = Random.secure();
  return List.generate(n, (_) => r.nextInt(256));
}
