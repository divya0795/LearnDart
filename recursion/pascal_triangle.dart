// Pascal's triangle: each entry is the sum of the two entries above it,
// with 1s on the edges. Entry (row, col) is the binomial coefficient
// C(row, col).

int pascal(int row, int col) => col == 0 || col == row
    ? 1
    : pascal(row - 1, col - 1) + pascal(row - 1, col);

List<int> pascalRow(int row) => [for (var c = 0; c <= row; c++) pascal(row, c)];
