// Problem 22 style: sort names alphabetically; a name's score is its
// alphabetical value (A=1, B=2, ...) times its 1-based position in the
// sorted list. Sum all the scores.
int alphaValue(String name) =>
    name.toUpperCase().codeUnits.fold(0, (a, c) => a + c - 64);
