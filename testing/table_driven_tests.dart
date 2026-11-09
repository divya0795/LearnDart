// Table-driven tests list inputs and expected outputs as data and run one
// loop over them; adding a case is one line.
int clamp(int x, int lo, int hi) => x < lo ? lo : (x > hi ? hi : x);

typedef Case = ({String name, List<int> input, int want});
