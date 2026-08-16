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

ListNode? fromList(List<int> xs) {
  ListNode? head;
  for (final x in xs.reversed) {
    head = ListNode(x, head);
  }
  return head;
}

List<int> toList(ListNode? n) => [for (var c = n; c != null; c = c.next) c.val];

void main() {
  print(toList(reverse(fromList([1, 2, 3, 4, 5]))));
  print(toList(reverseRecursive(fromList([1, 2, 3]))));
  print(toList(reverse(null)));
}
