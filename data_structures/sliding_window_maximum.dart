// Maximum of every window of size k in O(n) using a deque of indices that
// holds a decreasing run of values. The front is always the current
// window's maximum; indices that fall out of the window leave from the
// front, and smaller values are discarded from the back.
import 'dart:collection';

List<int> slidingMax(List<int> a, int k) {
  final dq = ListQueue<int>();
  final out = <int>[];
  for (var i = 0; i < a.length; i++) {
    while (dq.isNotEmpty && dq.first <= i - k) {
      dq.removeFirst();
    }
    while (dq.isNotEmpty && a[dq.last] <= a[i]) {
      dq.removeLast();
    }
    dq.addLast(i);
    if (i >= k - 1) out.add(a[dq.first]);
  }
  return out;
}
