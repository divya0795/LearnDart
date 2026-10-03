// State pattern: an object's behaviour depends on its state. Model states
// as a sealed class hierarchy; each state decides what an event does, and
// the compiler checks every state is handled.
sealed class DoorState {}

class Closed extends DoorState {}

class Open extends DoorState {}

class Locked extends DoorState {}

DoorState handle(DoorState s, String event) => switch ((s, event)) {
  (Closed(), 'open') => Open(),
  (Open(), 'close') => Closed(),
  (Closed(), 'lock') => Locked(),
  (Locked(), 'unlock') => Closed(),
  _ => s, // ignore invalid events
};

void main() {
  DoorState s = Closed();
  for (final e in ['open', 'lock', 'close', 'lock', 'open', 'unlock', 'open']) {
    final next = handle(s, e);
    print(
      '${s.runtimeType} --$e--> ${next.runtimeType}${identical(s, next) ? ' (ignored)' : ''}',
    );
    s = next;
  }
}
