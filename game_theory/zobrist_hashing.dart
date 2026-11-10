// Zobrist hashing: a fast incremental hash of a board position, used by
// game-tree search to recognise positions it has already seen. Give every
// (piece, square) pair a random key; a position's hash is the XOR of the
// keys of its pieces.
import 'dart:math';

class Zobrist {
  final List<List<int>> _keys;
  Zobrist(int pieces, int squares, {int seed = 1})
    : _keys = (() {
        final r = Random(seed);
        return List.generate(
          pieces,
          (_) => List.generate(
            squares,
            (_) => r.nextInt(1 << 32) << 20 ^ r.nextInt(1 << 32),
          ),
        );
      })();

  int hash(Map<int, int> squareToPiece) =>
      squareToPiece.entries.fold(0, (h, e) => h ^ _keys[e.value][e.key]);

  int move(int h, int piece, int from, int to) =>
      h ^ _keys[piece][from] ^ _keys[piece][to];
}
