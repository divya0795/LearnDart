// Gray code orders numbers so consecutive values differ in exactly one
// bit, which avoids glitches in rotary encoders. Convert binary to Gray
// with n ^ (n >> 1).
int toGray(int n) => n ^ (n >> 1);
