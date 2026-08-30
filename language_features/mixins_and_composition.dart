// A mixin packages behaviour that can be added to many classes without
// inheritance. Use `with` to apply it.
mixin Walker {
  int steps = 0;
  void walk() {
    steps++;
    print('$runtimeType walks (total $steps)');
  }
}

mixin Swimmer {
  void swim() => print('$runtimeType swims');
}

class Duck with Walker, Swimmer {}

class Dog with Walker {}
