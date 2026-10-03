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
