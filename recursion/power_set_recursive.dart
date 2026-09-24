// Power set by recursion: every subset of a list.
//
// For each element make two choices -- leave it out or put it in -- and
// recurse on the rest. The list of subsets of the tail is doubled by
// copying it with and without the head.

List<List<T>> powerSet<T>(List<T> xs) {
  if (xs.isEmpty) return [[]];
  final rest = powerSet(xs.sublist(1));
  return [
    ...rest,
    for (final s in rest) [xs.first, ...s],
  ];
}
