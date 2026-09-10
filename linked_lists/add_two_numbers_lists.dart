// Add two non-negative integers stored as linked lists of digits in
// reverse order (the head is the ones digit), like grade-school addition
// with a carry. Works for numbers far beyond 64 bits.
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? addNumbers(ListNode? a, ListNode? b) {
  final dummy = ListNode(0);
  var tail = dummy;
  var carry = 0;
  while (a != null || b != null || carry != 0) {
    final sum = (a?.val ?? 0) + (b?.val ?? 0) + carry;
    carry = sum ~/ 10;
    tail = tail.next = ListNode(sum % 10);
    a = a?.next;
    b = b?.next;
  }
  return dummy.next;
}
