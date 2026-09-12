// Flood fill (the paint-bucket tool): change a connected region of one
// colour to another, starting from a pixel. Neighbours are the 4 adjacent
// cells.
void floodFill(List<List<int>> img, int r, int c, int newColor) {
  final old = img[r][c];
  if (old == newColor) return;
  void go(int y, int x) {
    if (y < 0 ||
        x < 0 ||
        y >= img.length ||
        x >= img[0].length ||
        img[y][x] != old)
      return;
    img[y][x] = newColor;
    go(y + 1, x);
    go(y - 1, x);
    go(y, x + 1);
    go(y, x - 1);
  }

  go(r, c);
}

void floodFillIterative(List<List<int>> img, int r, int c, int newColor) {
  final old = img[r][c];
  if (old == newColor) return;
  final st = [(r, c)];
  while (st.isNotEmpty) {
    final (y, x) = st.removeLast();
    if (y < 0 ||
        x < 0 ||
        y >= img.length ||
        x >= img[0].length ||
        img[y][x] != old)
      continue;
    img[y][x] = newColor;
    st.addAll([(y + 1, x), (y - 1, x), (y, x + 1), (y, x - 1)]);
  }
}
