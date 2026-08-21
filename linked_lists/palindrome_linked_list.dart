// Is a linked list a palindrome? Find the middle, reverse the second half
// in place, compare it with the first half, then (optionally) restore.
// O(n) time and O(1) extra space.
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? _reverse(ListNode? h) {
  ListNode? prev;
  while (h != null) {
    final n = h.next;
    h.next = prev;
    prev = h;
    h = n;
  }
  return prev;
}

bool isPalindrome(ListNode? head) {
  var slow = head, fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  var second = _reverse(slow);
  var first = head;
  while (second != null) {
    if (first!.val != second.val) return false;
    first = first.next;
    second = second.next;
  }
  return true;
}
