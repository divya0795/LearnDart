// Recursive list helpers: sum, maximum and reversal without loops.
//
// Each follows the same template: handle the empty/single case, then
// combine the head with the answer for the tail.

int sum(List<int> a) => a.isEmpty ? 0 : a.first + sum(a.sublist(1));

int maxOf(List<int> a) {
  if (a.length == 1) return a.first;
  final m = maxOf(a.sublist(1));
  return a.first > m ? a.first : m;
}

List<int> reversed(List<int> a) =>
    a.isEmpty ? [] : [...reversed(a.sublist(1)), a.first];

void main() {
  final a = [3, 9, 2, 7];
  print('sum=${sum(a)} max=${maxOf(a)} reversed=${reversed(a)}');
}
