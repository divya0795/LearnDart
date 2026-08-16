// Reverse a singly linked list by re-pointing each node's `next` to the
// previous node while walking forward. O(n) time, O(1) space.
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? reverse(ListNode? head) {
  ListNode? prev;
  while (head != null) {
    final next = head.next;
    head.next = prev;
    prev = head;
    head = next;
  }
  return prev;
}

ListNode? reverseRecursive(ListNode? head) {
  if (head == null || head.next == null) return head;
  final newHead = reverseRecursive(head.next);
  head.next!.next = head;
  head.next = null;
  return newHead;
}
