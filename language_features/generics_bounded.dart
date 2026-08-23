// Generics let one implementation work for many types. A bound such as
// `T extends Comparable` lets the body use the capabilities of T.
T maxOf<T extends Comparable<dynamic>>(List<T> xs) {
  var best = xs.first;
  for (final x in xs.skip(1)) {
    if (x.compareTo(best) > 0) best = x;
  }
  return best;
}
