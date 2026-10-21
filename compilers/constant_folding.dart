// Constant folding: a compiler optimisation that evaluates constant
// sub-expressions at compile time, so `2 * 3 + x` becomes `6 + x`.
//
// Fold bottom-up: fold both children, and if both are now numbers,
// replace the node by its value. Algebraic identities (x+0, x*1, x*0)
// simplify further even when one side is unknown.

sealed class Expr {}

class Num extends Expr {
  final num v;
  Num(this.v);
  @override
  String toString() => '$v';
}

class Var extends Expr {
  final String name;
  Var(this.name);
  @override
  String toString() => name;
}

class Bin extends Expr {
  final String op;
  final Expr l, r;
  Bin(this.op, this.l, this.r);
  @override
  String toString() => '($l $op $r)';
}

Expr fold(Expr e) {
  if (e is! Bin) return e;
  final l = fold(e.l), r = fold(e.r);
  if (l is Num && r is Num) {
    return Num(switch (e.op) {
      '+' => l.v + r.v,
      '-' => l.v - r.v,
      '*' => l.v * r.v,
      _ => throw ArgumentError('unknown op ${e.op}'),
    });
  }
  if (e.op == '+' && r is Num && r.v == 0) return l;
  if (e.op == '+' && l is Num && l.v == 0) return r;
  if (e.op == '*' && ((r is Num && r.v == 1))) return l;
  if (e.op == '*' && ((l is Num && l.v == 1))) return r;
  if (e.op == '*' && ((l is Num && l.v == 0) || (r is Num && r.v == 0)))
    return Num(0);
  return Bin(e.op, l, r);
}

void main() {
  final e1 = Bin('+', Bin('*', Num(2), Num(3)), Var('x'));
  print('$e1  =>  ${fold(e1)}');
  final e2 = Bin('*', Bin('+', Var('y'), Num(0)), Bin('-', Num(5), Num(4)));
  print('$e2  =>  ${fold(e2)}');
  final e3 = Bin('*', Var('z'), Bin('-', Num(3), Num(3)));
  print('$e3  =>  ${fold(e3)}');
}
