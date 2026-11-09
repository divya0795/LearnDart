// Table-driven tests list inputs and expected outputs as data and run one
// loop over them; adding a case is one line.
int clamp(int x, int lo, int hi) => x < lo ? lo : (x > hi ? hi : x);

typedef Case = ({String name, List<int> input, int want});

List<String> runTable(int Function(List<int>) f, List<Case> cases) => [
  for (final c in cases)
    if (f(c.input) != c.want) '${c.name}: got ${f(c.input)}, want ${c.want}',
];
