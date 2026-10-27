// Assign cookies: child i is content with a cookie of size >= g[i]. Each
// child gets at most one cookie. Maximise the number of content children.
//
// Greedy: sort both; give each cookie to the least-greedy unsatisfied
// child it can satisfy, scanning cookies from smallest to largest.

int contentChildren(List<int> greed, List<int> cookies) {
  final g = [...greed]..sort(), s = [...cookies]..sort();
  var child = 0;
  for (final c in s) {
    if (child < g.length && c >= g[child]) child++;
  }
  return child;
}

void main() {
  print(contentChildren([1, 2, 3], [1, 1]));
  print(contentChildren([1, 2], [1, 2, 3]));
  print(contentChildren([10, 9, 8, 7], [5, 6, 7, 8]));
}
