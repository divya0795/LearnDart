// Monotonic stack: keep a stack of indices whose values are in decreasing
// order. When a larger value arrives, it is the "next greater element" for
// every smaller value it pops. Each index is pushed and popped once.
//
// Complexity: O(n).
List<int> nextGreater(List<int> a) {
  final res = List.filled(a.length, -1);
  final st = <int>[];
  for (var i = 0; i < a.length; i++) {
    while (st.isNotEmpty && a[st.last] < a[i]) {
      res[st.removeLast()] = a[i];
    }
    st.add(i);
  }
  return res;
}

List<int> daysUntilWarmer(List<int> t) {
  final res = List.filled(t.length, 0);
  final st = <int>[];
  for (var i = 0; i < t.length; i++) {
    while (st.isNotEmpty && t[st.last] < t[i]) {
      final j = st.removeLast();
      res[j] = i - j;
    }
    st.add(i);
  }
  return res;
}
