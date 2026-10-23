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

int maxAreaBrute(List<int> h) {
  var best = 0;
  for (var i = 0; i < h.length; i++) {
    for (var j = i + 1; j < h.length; j++) {
      final a = (j - i) * (h[i] < h[j] ? h[i] : h[j]);
      if (a > best) best = a;
    }
  }
  return best;
}

void main() {
  final h = [1, 8, 6, 2, 5, 4, 8, 3, 7];
  print('${maxArea(h)} (brute ${maxAreaBrute(h)})');
  print(maxArea([1, 1]));
}
