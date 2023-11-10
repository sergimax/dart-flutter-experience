// Миксины
import 'package:dart_project/otus/person.dart';

mixin Flying {
  final int flyingSpeed = 4;

  void fly() {
    print('mix fly');
  }
}

// Если знаем на какой тип точно надо навешивать миксин
mixin SuperFlying on Animal, Person {
  final int flyingSpeed = 400;

  void fly() {
    print('mix super fly');
  }
}

// Примешивание миксин. Последний миксин выше в приоритете
class Animal with Flying {

  void move() {
    // Использование метода из миксина
    fly();
  }
}