// Merge two sorted linked lists by splicing nodes (no new nodes except a
// dummy head). Always attach the smaller front node to the tail.
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? mergeTwo(ListNode? a, ListNode? b) {
  final dummy = ListNode(0);
  var tail = dummy;
  while (a != null && b != null) {
    if (a.val <= b.val) {
      tail.next = a;
      a = a.next;
    } else {
      tail.next = b;
      b = b.next;
    }
    tail = tail.next!;
  }
  tail.next = a ?? b;
  return dummy.next;
}

ListNode? sortList(ListNode? head) {
  if (head == null || head.next == null) return head;
  var slow = head, fast = head.next;
  while (fast != null && fast.next != null) {
    slow = slow.next!;
    fast = fast.next!.next;
  }
  final second = slow.next;
  slow.next = null;
  return mergeTwo(sortList(head), sortList(second));
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
  print(values(mergeTwo(build([1, 3, 5]), build([2, 4, 6, 8]))));
  print(values(sortList(build([4, 2, 1, 3, 9, 0]))));
}
