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

class Parser {
  final List<String> toks;
  int i = 0;
  Parser(String s)
    : toks = RegExp(r'\d+\.?\d*|[-+*/^()]')
          .allMatches(s)
          .map((m) => m[0]!)
          .toList();

  Expr parse([int minBp = 0]) {
    final t = toks[i++];
    Expr lhs;
    if (t == '(') {
      lhs = parse();
      i++;
    } else if (t == '-') {
      lhs = Neg(parse(5));
    } else {
      lhs = Num(double.parse(t));
    }
    while (i < toks.length) {
      final op = toks[i];
      final bp = _bp[op];
      if (bp == null || bp.$1 < minBp) break;
      i++;
      lhs = Bin(op, lhs, parse(bp.$2));
    }
    return lhs;
  }
}
