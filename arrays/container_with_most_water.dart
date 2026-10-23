// Container with most water: choose two vertical lines that, with the
// x-axis, hold the most water. Start with the widest pair; the area is
// limited by the shorter line, so only moving the shorter pointer inward
// can possibly improve the result.
int maxArea(List<int> h) {
  var l = 0, r = h.length - 1, best = 0;
  while (l < r) {
    final area = (r - l) * (h[l] < h[r] ? h[l] : h[r]);
    if (area > best) best = area;
    if (h[l] < h[r]) {
      l++;
    } else {
      r--;
    }
  }
  return best;
}
