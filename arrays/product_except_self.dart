// Product of array except self: out[i] = product of every element but a[i],
// without using division (so zeros are not a problem).
//
// out[i] = (product of everything left of i) * (product of everything
// right of i). Fill the left products in one pass, then multiply in the
// right products on a second pass using a running suffix.
//
// Complexity: O(n) time, O(1) extra space beyond the output.

List<int> productExceptSelf(List<int> a) {
  final n = a.length;
  final out = List.filled(n, 1);
  for (var i = 1; i < n; i++) {
    out[i] = out[i - 1] * a[i - 1];
  }
  var right = 1;
  for (var i = n - 1; i >= 0; i--) {
    out[i] *= right;
    right *= a[i];
  }
  return out;
}
