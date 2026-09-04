// Middle of a linked list in one pass: a slow pointer moves one step while
// a fast pointer moves two; when fast reaches the end, slow is at the
// middle (the second middle for even lengths).
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? middle(ListNode? head) {
  var slow = head, fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  return slow;
}
