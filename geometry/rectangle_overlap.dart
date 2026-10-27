// Do two axis-aligned rectangles overlap, and by how much?
//
// They are disjoint exactly when one lies entirely to one side of the
// other on either axis. Otherwise the overlap is the intersection of the
// x-intervals times the intersection of the y-intervals.

class Rect {
  final double x1, y1, x2, y2; // bottom-left and top-right
  const Rect(this.x1, this.y1, this.x2, this.y2);
  double get area => (x2 - x1) * (y2 - y1);
}
