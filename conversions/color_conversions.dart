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
