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
