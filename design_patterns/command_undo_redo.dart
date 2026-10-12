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

class Editor {
  final _done = <Command>[], _undone = <Command>[];

  void run(Command c) {
    c.execute();
    _done.add(c);
    _undone.clear();
  }

  void undo() {
    if (_done.isEmpty) return;
    final c = _done.removeLast()..undo();
    _undone.add(c);
  }

  void redo() {
    if (_undone.isEmpty) return;
    final c = _undone.removeLast()..execute();
    _done.add(c);
  }
}

void main() {
  final doc = Document();
  final ed = Editor();
  ed.run(Append(doc, 'Hello'));
  ed.run(Append(doc, ', world'));
  print(doc.text);
  ed.undo();
  print(doc.text);
  ed.redo();
  print(doc.text);
}
