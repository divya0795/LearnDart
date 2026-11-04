// CSV parser that handles quoted fields, embedded commas, escaped quotes
// ("") and newlines inside quotes -- the cases a naive split(',') gets
// wrong. A tiny state machine tracks whether we are inside quotes.
List<List<String>> parseCsv(String input) {
  final rows = <List<String>>[];
  var row = <String>[];
  final field = StringBuffer();
  var inQuotes = false;
  for (var i = 0; i < input.length; i++) {
    final c = input[i];
    if (inQuotes) {
      if (c == '"') {
        if (i + 1 < input.length && input[i + 1] == '"') {
          field.write('"');
          i++;
        } else {
          inQuotes = false;
        }
      } else {
        field.write(c);
      }
    } else if (c == '"') {
      inQuotes = true;
    } else if (c == ',') {
      row.add(field.toString());
      field.clear();
    } else if (c == '\n') {
      row.add(field.toString());
      field.clear();
      rows.add(row);
      row = [];
    } else if (c != '\r') {
      field.write(c);
    }
  }
  if (field.isNotEmpty || row.isNotEmpty) {
    row.add(field.toString());
    rows.add(row);
  }
  return rows;
}

List<Map<String, String>> toRecords(List<List<String>> rows) {
  final header = rows.first;
  return [
    for (final r in rows.skip(1))
      {for (var i = 0; i < header.length; i++) header[i]: r[i]},
  ];
}
