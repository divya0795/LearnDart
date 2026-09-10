// Pratt parsing: each token has a binding power; parseExpr(minBp) reads a
// prefix expression and then keeps consuming infix operators that bind at
// least as tightly as minBp. Elegant and easy to extend with new
// operators.
const _bp = {'+': (1, 2), '-': (1, 2), '*': (3, 4), '/': (3, 4), '^': (6, 5)};

sealed class Expr {}

class Num extends Expr {
  final double v;
  Num(this.v);
}

class Bin extends Expr {
  final String op;
  final Expr l, r;
  Bin(this.op, this.l, this.r);
}

class Neg extends Expr {
  final Expr e;
  Neg(this.e);
}
