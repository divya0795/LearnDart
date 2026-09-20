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

List<int> xorBytes(List<int> data, List<int> key) {
  if (key.length < data.length) throw ArgumentError('key too short');
  return [for (var i = 0; i < data.length; i++) data[i] ^ key[i]];
}

void main() {
  final m = utf8.encode('attack at dawn');
  final key = randomKey(m.length);
  final c = xorBytes(m, key);
  print('cipher: $c');
  print('plain : ${utf8.decode(xorBytes(c, key))}');
  final m2 = utf8.encode('retreat at six');
  final c2 = xorBytes(m2, key);
  final leak = xorBytes(c, c2);
  final real = xorBytes(m, m2);
  print('key reuse leaks m1^m2: ${leak.toString() == real.toString()}');
}
