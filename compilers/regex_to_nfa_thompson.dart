// Thompson's construction turns a regular expression into an NFA: each
// literal is a two-state fragment; concatenation, alternation (|) and
// star (*) glue fragments together with epsilon transitions. Input is
// postfix with '.' as explicit concatenation (e.g. "ab.c|" for (ab)|c).
class State {
  final int id;
  int? char; // null means epsilon
  State? out1, out2;
  State(this.id);
}

class Frag {
  final State start;
  final List<State> ends;
  Frag(this.start, this.ends);
}

(State, State) build(String postfix) {
  var n = 0;
  final st = <Frag>[];
  final accept = State(-1);
  for (final c in postfix.codeUnits.map(String.fromCharCode)) {
    switch (c) {
      case '.':
        final b = st.removeLast(), a = st.removeLast();
        for (final e in a.ends) {
          e.out1 = b.start;
        }
        st.add(Frag(a.start, b.ends));
      case '|':
        final b = st.removeLast(), a = st.removeLast();
        final s = State(n++)
          ..out1 = a.start
          ..out2 = b.start;
        st.add(Frag(s, [...a.ends, ...b.ends]));
      case '*':
        final a = st.removeLast();
        final s = State(n++)..out1 = a.start;
        for (final e in a.ends) {
          e.out1 = s;
        }
        st.add(Frag(s, [s]));
      default:
        final s = State(n++)..char = c.codeUnitAt(0);
        st.add(Frag(s, [s]));
    }
  }
  final f = st.removeLast();
  for (final e in f.ends) {
    e.out1 = accept;
  }
  return (f.start, accept);
}
