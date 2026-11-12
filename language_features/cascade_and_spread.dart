// The cascade operator `..` calls several members on the same object and
// returns that object, which makes configuration code compact.
class Pen {
  String color = 'black';
  double width = 1;
  final List<String> log = [];
  void move(int x, int y) => log.add('move $x,$y');
  void draw(int x, int y) => log.add('draw $x,$y');
}

Pen drawSquare() => Pen()
  ..color = 'red'
  ..width = 2.5
  ..move(0, 0)
  ..draw(10, 0)
  ..draw(10, 10)
  ..draw(0, 10)
  ..draw(0, 0);

List<int> build({bool includeZero = false}) => [
  if (includeZero) 0,
  for (var i = 1; i <= 3; i++) i * i,
  ...[100, 200],
];

Map<String, int> merge(Map<String, int> a, Map<String, int>? b) => {
  ...a,
  ...?b,
};
