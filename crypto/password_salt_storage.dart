// Password storage basics: never store passwords, store a salted hash. A
// random salt per user makes identical passwords hash differently and
// defeats precomputed tables. (The hash here is a toy; use a real KDF.)
import 'dart:math';

List<int> newSalt([int n = 16]) {
  final r = Random.secure();
  return List.generate(n, (_) => r.nextInt(256));
}

int toyHash(List<int> d) =>
    d.fold(0x811c9dc5, (h, x) => ((h ^ x) * 0x01000193) & 0xffffffff);

class Credential {
  final List<int> salt;
  final int hash;
  Credential._(this.salt, this.hash);

  factory Credential.create(String password) {
    final s = newSalt();
    return Credential._(s, toyHash([...s, ...password.codeUnits]));
  }

  bool verify(String attempt) =>
      toyHash([...salt, ...attempt.codeUnits]) == hash;
}
