// Records are lightweight, immutable, anonymous aggregates. They are ideal
// for returning several values from a function.
(int min, int max) minMax(List<int> xs) =>
    (xs.reduce((a, b) => a < b ? a : b), xs.reduce((a, b) => a > b ? a : b));

({String name, int age}) person() => (name: 'Ada', age: 36);
