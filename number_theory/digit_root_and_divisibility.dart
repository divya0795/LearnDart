// Classic divisibility rules: a number is divisible by 3 (or 9) exactly
// when its digit sum is; by 11 when the alternating digit sum is; by 2, 5
// and 10 by the last digit. Implemented on the digit string, so they work
// for numbers far larger than a machine integer.
int _digitSum(String s) => s.split('').fold(0, (a, d) => a + int.parse(d));

bool divisibleBy3(String n) => _digitSum(n) % 3 == 0;
bool divisibleBy9(String n) => _digitSum(n) % 9 == 0;

bool divisibleBy11(String n) {
  var alt = 0;
  for (var i = 0; i < n.length; i++) {
    final d = int.parse(n[n.length - 1 - i]);
    alt += i.isEven ? d : -d;
  }
  return alt % 11 == 0;
}

int bigMod(String n, int m) {
  var r = 0;
  for (final d in n.split('')) {
    r = (r * 10 + int.parse(d)) % m;
  }
  return r;
}

void main() {
  const big = '123456789012345678901234567890';
  print(
    '3: ${divisibleBy3(big)} 9: ${divisibleBy9(big)} 11: ${divisibleBy11(big)}',
  );
  print('big mod 97 = ${bigMod(big, 97)}');
  print('check: ${BigInt.parse(big) % BigInt.from(97)}');
}
