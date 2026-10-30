// Single-decree Paxos: a group of acceptors agrees on ONE value even with
// competing proposers. Phase 1 (prepare/promise) reserves a proposal
// number; phase 2 (accept) asks acceptors to adopt a value. A majority of
// accepts means the value is chosen.
class Acceptor {
  int promised = 0;
  int acceptedN = 0;
  String? acceptedValue;

  (bool, int, String?) prepare(int n) {
    if (n > promised) {
      promised = n;
      return (true, acceptedN, acceptedValue);
    }
    return (false, 0, null);
  }

  bool accept(int n, String v) {
    if (n >= promised) {
      promised = n;
      acceptedN = n;
      acceptedValue = v;
      return true;
    }
    return false;
  }
}
