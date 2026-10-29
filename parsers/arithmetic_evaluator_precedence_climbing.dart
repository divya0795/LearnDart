// Precedence climbing: a compact way to parse infix expressions. Each
// operator has a precedence and associativity; parseExpr(minPrec) reads an
// operand, then keeps consuming operators whose precedence >= minPrec,
// recursing with a higher minimum for the right-hand side.
class Evaluator {
  final String s;
  int i = 0;
  Evaluator(this.s);

  static const _prec = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3};

  void _ws() {
    while (i < s.length && s[i] == ' ') i++;
  }

  double _atom() {
    _ws();
    if (s[i] == '(') {
      i++;
      final v = parse(1);
      _ws();
      i++; // ')'
      return v;
    }
    if (s[i] == '-') {
      i++;
      return -_atom();
    }
    final m = RegExp(r'\d+(\.\d+)?').matchAsPrefix(s, i)!;
    i = m.end;
    return double.parse(m[0]!);
  }

  double parse(int minPrec) {
    var left = _atom();
    while (true) {
      _ws();
      if (i >= s.length || !_prec.containsKey(s[i])) return left;
      final op = s[i];
      final p = _prec[op]!;
      if (p < minPrec) return left;
      i++;
      final right = parse(op == '^' ? p : p + 1); // ^ is right-associative
      left = switch (op) {
        '+' => left + right,
        '-' => left - right,
        '*' => left * right,
        '/' => left / right,
        _ => _pow(left, right),
      };
    }
  }
}

double _pow(double b, double e) {
  var r = 1.0;
  for (var k = 0; k < e; k++) {
    r *= b;
  }
  return r;
}

double evaluate(String s) => Evaluator(s).parse(1);

void main() {
  for (final e in [
    '1 + 2 * 3',
    '(1 + 2) * 3',
    '2 ^ 3 ^ 2',
    '10 / 4 - 1',
    '-(2 + 3) * 2',
  ]) {
    print('$e = ${evaluate(e)}');
  }
}
