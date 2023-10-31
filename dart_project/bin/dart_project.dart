import 'package:dart_project/dart_project.dart' as dart_project;
import 'dart:math';
import 'package:characters/characters.dart';

void main(List<String> arguments) {
    print('Hello world: ${dart_project.calculate()}!');
    print(sin(45 * pi / 180));
    print(sqrt(2));
    const int myAge = 100;
    double averageAge = 100;
    averageAge = 150;
    const testNumber = 9;
    print(testNumber);
    const evenOdd = testNumber % 2;
    print(evenOdd);
    var alpha = 100;
    alpha += evenOdd;
    print(alpha);

    const family = "👨‍👩‍👧‍👦";
    print(family.characters.length);
}
