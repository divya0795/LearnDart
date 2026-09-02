// Jump game: a[i] is the maximum jump length from index i. Can you reach
// the last index starting at 0?
//
// Greedy: keep the farthest index reachable so far. If the scan ever
// reaches an index beyond that frontier, we are stuck.

bool canJump(List<int> a) {
  var far = 0;
  for (var i = 0; i < a.length; i++) {
    if (i > far) return false;
    if (i + a[i] > far) far = i + a[i];
  }
  return true;
}
