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

ListNode? fromInt(String digits) {
  ListNode? h;
  for (final c in digits.split('')) {
    h = ListNode(int.parse(c), h);
  }
  return h;
}

String toStr(ListNode? n) {
  final d = <int>[];
  for (var c = n; c != null; c = c.next) {
    d.add(c.val);
  }
  return d.reversed.join();
}

void main() {
  print(toStr(addNumbers(fromInt('342'), fromInt('465'))));
  print(toStr(addNumbers(fromInt('999'), fromInt('1'))));
  print(toStr(addNumbers(fromInt('99999999999999999999'), fromInt('1'))));
}
