// Missing number: a list holds n distinct values from 0..n; find the one
// that is absent.
//
// XOR is its own inverse, so XOR-ing every index 0..n with every value
// cancels all present numbers and leaves only the missing one.
//
// Complexity: O(n) time, O(1) space, no overflow risk (unlike summing).

int missingNumber(List<int> a) {
  var x = a.length;
  for (var i = 0; i < a.length; i++) {
    x ^= i ^ a[i];
  }
  return x;
}
