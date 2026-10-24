// Recursive list helpers: sum, maximum and reversal without loops.
//
// Each follows the same template: handle the empty/single case, then
// combine the head with the answer for the tail.

int sum(List<int> a) => a.isEmpty ? 0 : a.first + sum(a.sublist(1));
