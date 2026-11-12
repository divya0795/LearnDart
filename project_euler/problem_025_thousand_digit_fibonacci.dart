// Problem 25: what is the index of the first Fibonacci term with 1000
// digits? Iterate with BigInt until the decimal length reaches the target.
int firstFibWithDigits(int digits) {
  var a = BigInt.one, b = BigInt.one;
  var i = 2;
  while (b.toString().length < digits) {
    final t = a + b;
    a = b;
    b = t;
    i++;
  }
  return i;
}
