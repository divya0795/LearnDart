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

int largestRectangle(List<int> h) {
  final st = <int>[];
  var best = 0;
  for (var i = 0; i <= h.length; i++) {
    final cur = i == h.length ? 0 : h[i];
    while (st.isNotEmpty && h[st.last] >= cur) {
      final height = h[st.removeLast()];
      final left = st.isEmpty ? -1 : st.last;
      final area = height * (i - left - 1);
      if (area > best) best = area;
    }
    st.add(i);
  }
  return best;
}

void main() {
  print(nextGreater([4, 5, 2, 25, 7, 8]));
  print(daysUntilWarmer([73, 74, 75, 71, 69, 72, 76, 73]));
  print(largestRectangle([2, 1, 5, 6, 2, 3]));
}
