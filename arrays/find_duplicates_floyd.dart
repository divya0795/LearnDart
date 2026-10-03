// Find the one repeated number in a list of n+1 values drawn from 1..n,
// without modifying the list and with O(1) space. Treat the list as a
// linked list (i -> a[i]); the duplicate is where the cycle starts.
int findDuplicate(List<int> a) {
  var slow = a[0], fast = a[0];
  do {
    slow = a[slow];
    fast = a[a[fast]];
  } while (slow != fast);
  slow = a[0];
  while (slow != fast) {
    slow = a[slow];
    fast = a[fast];
  }
  return slow;
}

List<int> findAllDuplicates(List<int> nums) {
  final a = [...nums];
  final out = <int>[];
  for (final x in a.toList()) {
    final i = x.abs() - 1;
    if (a[i] < 0) {
      out.add(x.abs());
    } else {
      a[i] = -a[i];
    }
  }
  return out;
}

void main() {
  print(findDuplicate([1, 3, 4, 2, 2]));
  print(findDuplicate([3, 1, 3, 4, 2]));
  print(findAllDuplicates([4, 3, 2, 7, 8, 2, 3, 1]));
}
