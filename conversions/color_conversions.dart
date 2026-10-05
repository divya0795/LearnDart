// Colour conversions: hex string <-> RGB triple. A hex colour is three
// bytes written in base 16, e.g. #FF8800 = (255, 136, 0).
(int, int, int) hexToRgb(String hex) {
  var h = hex.replaceFirst('#', '');
  if (h.length == 3) h = h.split('').map((c) => c + c).join();
  if (h.length != 6) throw FormatException('bad colour: $hex');
  return (
    int.parse(h.substring(0, 2), radix: 16),
    int.parse(h.substring(2, 4), radix: 16),
    int.parse(h.substring(4, 6), radix: 16),
  );
}

String rgbToHex(int r, int g, int b) =>
    '#${[r, g, b].map((v) => v.clamp(0, 255).toRadixString(16).padLeft(2, '0')).join()}'
        .toUpperCase();

(double h, double s, double l) rgbToHsl(int r, int g, int b) {
  final rf = r / 255, gf = g / 255, bf = b / 255;
  final mx = [rf, gf, bf].reduce((a, c) => a > c ? a : c);
  final mn = [rf, gf, bf].reduce((a, c) => a < c ? a : c);
  final l = (mx + mn) / 2;
  if (mx == mn) return (0, 0, l);
  final d = mx - mn;
  final s = l > 0.5 ? d / (2 - mx - mn) : d / (mx + mn);
  final h =
      (mx == rf
          ? (gf - bf) / d + (gf < bf ? 6 : 0)
          : mx == gf
          ? (bf - rf) / d + 2
          : (rf - gf) / d + 4) *
      60;
  return (h, s, l);
}
