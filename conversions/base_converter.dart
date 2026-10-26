// Convert a non-negative integer between any bases from 2 to 36.
//
// To write n in base b, repeatedly take n % b (the next digit, least
// significant first) and divide n by b. To parse, fold digits left to
// right: value = value * b + digit.

const _digits = '0123456789abcdefghijklmnopqrstuvwxyz';
