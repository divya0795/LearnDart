// Command: turn an action into an object so it can be queued, logged and
// undone. Each command knows how to execute and how to reverse itself.
abstract interface class Command {
  void execute();
  void undo();
}

class Document {
  String text = '';
}

class Append implements Command {
  final Document doc;
  final String s;
  Append(this.doc, this.s);
  @override
  void execute() => doc.text += s;
  @override
  void undo() => doc.text = doc.text.substring(0, doc.text.length - s.length);
}
