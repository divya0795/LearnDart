// Sum of digits and digital root with recursion.
//
// The last digit is n % 10 and the rest is n ~/ 10, so
// sum(n) = n % 10 + sum(n ~/ 10). The digital root repeats this until a
// single digit remains.

int digitSum(int n) => n < 10 ? n : n % 10 + digitSum(n ~/ 10);

int digitalRoot(int n) => n < 10 ? n : digitalRoot(digitSum(n));

void main() {
  print(digitSum(12345));
  print(digitalRoot(987654321));
  print(digitalRoot(493193));
}
