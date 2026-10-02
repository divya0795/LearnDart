// An LFSR produces a pseudo-random bit stream by shifting a register and
// feeding back the XOR of chosen "tap" bits. XOR-ing the stream with the
// data gives a simple stream cipher. LFSRs are fast but linear -- they
// are easily broken on their own, which is why real ciphers combine them
// non-linearly.
class Lfsr {
  int state;
  final List<int> taps;
  final int width;
  Lfsr(this.state, this.taps, this.width);

  int nextBit() {
    var fb = 0;
    for (final t in taps) {
      fb ^= (state >> t) & 1;
    }
    final out = state & 1;
    state = (state >> 1) | (fb << (width - 1));
    return out;
  }

  int nextByte() {
    var b = 0;
    for (var i = 0; i < 8; i++) {
      b |= nextBit() << i;
    }
    return b;
  }
}
