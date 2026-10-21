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
