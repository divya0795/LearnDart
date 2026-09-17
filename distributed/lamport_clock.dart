// Lamport logical clock: order events in a distributed system without
// synchronised wall clocks.
//
// Rules: increment the counter before each local event or send; stamp the
// message with it; on receive, set counter = max(local, message) + 1.
// If event A happened-before B then L(A) < L(B). The converse does not
// hold (that is what vector clocks add).

class Process {
  final String name;
  int clock = 0;
  Process(this.name);

  int local(String what) {
    clock++;
    print('$name@$clock: $what');
    return clock;
  }

  int send(String what) => local('send $what');

  int receive(int stamp, String what) {
    clock = (clock > stamp ? clock : stamp) + 1;
    print('$name@$clock: receive $what');
    return clock;
  }
}
