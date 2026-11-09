// Table-driven tests list inputs and expected outputs as data and run one
// loop over them; adding a case is one line.
int clamp(int x, int lo, int hi) => x < lo ? lo : (x > hi ? hi : x);

typedef Case = ({String name, List<int> input, int want});

List<String> runTable(int Function(List<int>) f, List<Case> cases) => [
  for (final c in cases)
    if (f(c.input) != c.want) '${c.name}: got ${f(c.input)}, want ${c.want}',
];

void main() {
  final cases = <Case>[
    (name: 'inside', input: [5, 0, 10], want: 5),
    (name: 'below', input: [-3, 0, 10], want: 0),
    (name: 'above', input: [42, 0, 10], want: 10),
    (name: 'edge low', input: [0, 0, 10], want: 0),
    (name: 'wrong expectation', input: [5, 0, 3], want: 5),
  ];
  final failures = runTable((i) => clamp(i[0], i[1], i[2]), cases);
  print(failures.isEmpty ? 'all passed' : failures.join('\n'));
}
