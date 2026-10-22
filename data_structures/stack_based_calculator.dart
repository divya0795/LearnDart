// Reverse Polish notation (postfix) needs no parentheses or precedence:
// push numbers, and when an operator appears pop two operands, apply it,
// and push the result.
double evalPostfix(String expr) {
  final st = <double>[];
  for (final tok in expr.trim().split(RegExp(r'\s+'))) {
    switch (tok) {
      case '+' || '-' || '*' || '/':
        if (st.length < 2) throw FormatException('missing operand for $tok');
        final b = st.removeLast(), a = st.removeLast();
        st.add(switch (tok) {
          '+' => a + b,
          '-' => a - b,
          '*' => a * b,
          _ => a / b,
        });
      default:
        st.add(double.parse(tok));
    }
  }
  if (st.length != 1) throw const FormatException('malformed expression');
  return st.single;
}

void main() {
  print(evalPostfix('3 4 + 2 *'));
  print(evalPostfix('5 1 2 + 4 * + 3 -'));
  for (final bad in ['1 +', '1 2', 'x']) {
    try {
      evalPostfix(bad);
    } on FormatException catch (e) {
      print('"$bad": ${e.message}');
    }
  }
}
