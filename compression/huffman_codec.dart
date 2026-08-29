// Huffman coding: build a prefix-free binary code where frequent symbols
// get short codes and rare ones get long codes.
//
// Repeatedly merge the two least-frequent nodes into a parent until one
// tree remains; the path from the root (left=0, right=1) is each symbol's
// code. No code is a prefix of another, so decoding is unambiguous.
//
// Complexity: O(k log k) to build for k distinct symbols.

class _Node {
  final int freq;
  final String? sym;
  final _Node? left, right;
  _Node(this.freq, {this.sym, this.left, this.right});
}
