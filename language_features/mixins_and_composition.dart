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

abstract class Animal {
  String get name;
}

mixin Greets on Animal {
  void greet() => print('Hi, I am $name');
}

class Cat extends Animal with Greets {
  @override
  String get name => 'Tom';
}

void main() {
  final duck = Duck()
    ..walk()
    ..swim()
    ..walk();
  Dog().walk();
  Cat().greet();
  final Object d = duck, dog = Dog();
  print('duck is Walker: ${d is Walker}, dog is Swimmer: ${dog is Swimmer}');
}
