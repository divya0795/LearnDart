// Print a number in binary using recursion.
//
// Base case: 0 or 1 is its own binary digit. Otherwise the binary form of
// n is the binary form of n ~/ 2 followed by the digit n % 2.

String toBinary(int n) => n < 2 ? '$n' : toBinary(n ~/ 2) + '${n % 2}';

int countOnes(int n) => n == 0 ? 0 : (n & 1) + countOnes(n >> 1);
