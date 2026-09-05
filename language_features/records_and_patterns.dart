// Records are lightweight, immutable, anonymous aggregates. They are ideal
// for returning several values from a function.
(int min, int max) minMax(List<int> xs) =>
    (xs.reduce((a, b) => a < b ? a : b), xs.reduce((a, b) => a > b ? a : b));

({String name, int age}) person() => (name: 'Ada', age: 36);

void demoDestructuring() {
  final (lo, hi) = minMax([4, 9, 2, 7]);
  print('range $lo..$hi');
  final (:name, :age) = person();
  print('$name is $age');
  final [first, second, ...rest] = [1, 2, 3, 4, 5];
  print('$first $second $rest');
}

String describe(Object? o) => switch (o) {
  int n when n < 0 => 'negative int',
  int n => 'int $n',
  String s when s.isEmpty => 'empty string',
  String s => 'string of ${s.length}',
  (int a, int b) => 'pair summing ${a + b}',
  [var x, ...] => 'list starting with $x',
  null => 'null',
  _ => 'something else',
};
