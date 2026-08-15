// Three-address code (TAC): an intermediate representation where each
// instruction has at most one operator, like "t1 = b * c". Walk the
// expression tree bottom-up, giving each interior node a fresh temporary.
sealed class E {}

class Lit extends E {
  final String name;
  Lit(this.name);
}

class Bin extends E {
  final String op;
  final E l, r;
  Bin(this.op, this.l, this.r);
}

class Gen {
  final code = <String>[];
  var _t = 0;

  String emit(E e) {
    if (e is Lit) return e.name;
    final b = e as Bin;
    final l = emit(b.l), r = emit(b.r);
    final t = 't${++_t}';
    code.add('$t = $l ${b.op} $r');
    return t;
  }
}
