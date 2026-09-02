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

int minJumps(List<int> a) {
  var jumps = 0, curEnd = 0, far = 0;
  for (var i = 0; i < a.length - 1; i++) {
    if (i + a[i] > far) far = i + a[i];
    if (i == curEnd) {
      jumps++;
      curEnd = far;
    }
  }
  return jumps;
}

void main() {
  print(canJump([2, 3, 1, 1, 4]));
  print(canJump([3, 2, 1, 0, 4]));
  print(minJumps([2, 3, 1, 1, 4]));
}
