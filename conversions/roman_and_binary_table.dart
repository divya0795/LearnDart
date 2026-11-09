// Print a number table showing decimal, binary, octal, hexadecimal and
// Roman forms side by side. Dart's int.toRadixString covers bases 2-36.
String toRoman(int n) {
  const t = [
    (1000, 'M'),
    (900, 'CM'),
    (500, 'D'),
    (400, 'CD'),
    (100, 'C'),
    (90, 'XC'),
    (50, 'L'),
    (40, 'XL'),
    (10, 'X'),
    (9, 'IX'),
    (5, 'V'),
    (4, 'IV'),
    (1, 'I'),
  ];
  final b = StringBuffer();
  for (final (v, s) in t) {
    while (n >= v) {
      b.write(s);
      n -= v;
    }
  }
  return b.toString();
}

String table(Iterable<int> ns) {
  final rows = [
    for (final n in ns)
      '${'$n'.padLeft(4)} | ${n.toRadixString(2).padLeft(8, '0')} | ${n.toRadixString(8).padLeft(4)} | ${n.toRadixString(16).toUpperCase().padLeft(3)} | ${toRoman(n)}',
  ];
  return ['   n |   binary  | oct  | hex | roman', ...rows].join('\n');
}

void main() => print(table([1, 4, 9, 14, 40, 90, 255]));
