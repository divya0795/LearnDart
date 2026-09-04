// Maximum product subarray. A negative number can flip the smallest
// product into the largest, so track both the max and the min product of
// subarrays ending at each index.
int maxProduct(List<int> a) {
  var curMax = a[0], curMin = a[0], best = a[0];
  for (var i = 1; i < a.length; i++) {
    final x = a[i];
    final hi = curMax * x, lo = curMin * x;
    curMax = [x, hi, lo].reduce((p, q) => p > q ? p : q);
    curMin = [x, hi, lo].reduce((p, q) => p < q ? p : q);
    if (curMax > best) best = curMax;
  }
  return best;
}

void main() {
  print(maxProduct([2, 3, -2, 4]));
  print(maxProduct([-2, 0, -1]));
  print(maxProduct([-2, 3, -4]));
}
