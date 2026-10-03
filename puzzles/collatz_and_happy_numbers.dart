// A happy number eventually reaches 1 when repeatedly replaced by the sum
// of the squares of its digits; unhappy numbers fall into a cycle
// (containing 4). Floyd's cycle detection finds the answer in O(1) space.
int next(int n) {
  var s = 0;
  while (n > 0) {
    final d = n % 10;
    s += d * d;
    n ~/= 10;
  }
  return s;
}

bool isHappy(int n) {
  var slow = n, fast = next(n);
  while (fast != 1 && slow != fast) {
    slow = next(slow);
    fast = next(next(fast));
  }
  return fast == 1;
}
