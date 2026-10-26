// A normal stream allows one listener. A broadcast StreamController lets
// many listeners subscribe to the same events; each only sees events added
// after it subscribed.
import 'dart:async';

Future<void> main() async {
  final c = StreamController<String>.broadcast();
  final logA = <String>[], logB = <String>[];
  final subA = c.stream.listen((e) => logA.add(e));
  c.add('one');
  final subB = c.stream.listen((e) => logB.add(e));
  c.add('two');
  await subA.cancel();
  c.add('three');
  await Future<void>.delayed(Duration.zero);
  print('A saw $logA');
  print('B saw $logB');
  await subB.cancel();
  await c.close();
}
