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

ListNode? removeNthFromEnd(ListNode? head, int n) {
  final dummy = ListNode(0, head);
  var lead = dummy, lag = dummy;
  for (var i = 0; i < n; i++) {
    lead = lead.next!;
  }
  while (lead.next != null) {
    lead = lead.next!;
    lag = lag.next!;
  }
  lag.next = lag.next!.next;
  return dummy.next;
}

ListNode? build(List<int> xs) {
  ListNode? h;
  for (final x in xs.reversed) {
    h = ListNode(x, h);
  }
  return h;
}

List<int> values(ListNode? n) => [for (var c = n; c != null; c = c.next) c.val];

void main() {
  print('middle of 1..5: ${middle(build([1, 2, 3, 4, 5]))!.val}');
  print('middle of 1..6: ${middle(build([1, 2, 3, 4, 5, 6]))!.val}');
  print(values(removeNthFromEnd(build([1, 2, 3, 4, 5]), 2)));
}
