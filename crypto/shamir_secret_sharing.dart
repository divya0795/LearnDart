// Shamir's secret sharing: split a secret into n shares so that any k of
// them reconstruct it, but k-1 reveal nothing.
//
// Pick a random polynomial of degree k-1 over a prime field whose constant
// term is the secret; share i is the point (i, f(i)). Any k points
// determine the polynomial, and Lagrange interpolation at x=0 recovers
// the secret. Arithmetic is mod p = 2^31-1 so products fit in 64 bits.
import 'dart:math';

const p = 2147483647;
