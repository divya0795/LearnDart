// A tiny assembler for a stack machine: each line is "OP" or "OP arg".
// Labels ("name:") mark jump targets; the assembler resolves them to
// instruction indices in a second pass.
enum Op { push, add, sub, mul, dup, jmp, jz, print, halt }

typedef Instr = (Op, int);

List<Instr> assemble(String src) {
  final labels = <String, int>{};
  final lines = <List<String>>[];
  for (final raw in src.split('\n')) {
    final line = raw.split(';').first.trim();
    if (line.isEmpty) continue;
    if (line.endsWith(':')) {
      labels[line.substring(0, line.length - 1)] = lines.length;
    } else {
      lines.add(line.split(RegExp(r'\s+')));
    }
  }
  return [
    for (final p in lines)
      (
        Op.values.byName(p[0].toLowerCase()),
        p.length > 1 ? (labels[p[1]] ?? int.parse(p[1])) : 0,
      ),
  ];
}

List<int> run(List<Instr> prog) {
  final st = <int>[], out = <int>[];
  var pc = 0;
  while (pc < prog.length) {
    final (op, arg) = prog[pc++];
    switch (op) {
      case Op.push:
        st.add(arg);
      case Op.add:
        st.add(st.removeLast() + st.removeLast());
      case Op.sub:
        final b = st.removeLast();
        st.add(st.removeLast() - b);
      case Op.mul:
        st.add(st.removeLast() * st.removeLast());
      case Op.dup:
        st.add(st.last);
      case Op.jmp:
        pc = arg;
      case Op.jz:
        if (st.removeLast() == 0) pc = arg;
      case Op.print:
        out.add(st.last);
      case Op.halt:
        return out;
    }
  }
  return out;
}

void main() {
  final prog = assemble('''
    push 3
  loop:
    print
    push 1
    sub
    dup
    jz end
    jmp loop
  end:
    halt
  ''');
  print(run(prog));
}
