// Key stretching makes password guessing slower by repeating a hash many
// times with a salt. This demo uses a toy 32-bit hash to show the shape
// of PBKDF2-style derivation; use a real KDF (PBKDF2, scrypt, Argon2)
// with a real hash in production.
int _mix(int h, int x) => (((h ^ x) * 0x01000193) & 0xffffffff);

int toyHash(List<int> data) => data.fold(0x811c9dc5, _mix);

int stretch(String password, List<int> salt, int iterations) {
  var h = toyHash([...salt, ...password.codeUnits]);
  for (var i = 1; i < iterations; i++) {
    h = toyHash([
      ...salt,
      h & 255,
      (h >> 8) & 255,
      (h >> 16) & 255,
      (h >> 24) & 255,
    ]);
  }
  return h;
}

void main() {
  final salt = [1, 2, 3, 4];
  for (final n in [1, 1000, 100000]) {
    final sw = Stopwatch()..start();
    final k = stretch('hunter2', salt, n);
    print(
      'iterations=$n key=${k.toRadixString(16)} time=${sw.elapsedMicroseconds}us',
    );
  }
  print(
    'different salt, different key: ${stretch('hunter2', [9], 1000) != stretch('hunter2', salt, 1000)}',
  );
}
