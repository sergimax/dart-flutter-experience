// Необходимо разработать алгоритм на Dart для интерпретации математических выражений (действия сложения, вычитания, умножения, деления, должны поддерживаться числовые константы и именованные переменные, а также скобки).
// Преобразователь должен быть оформлен как класс (конструктор принимает строку с математической функций) с функцией преобразования, принимающей Map с переменными (ключ - название переменной, значение - числовое значение, которое подставляется вместо переменной) и возвращающей значение типа double.
//При вычислении значения выражения необходимо учитывать приоритет математических операций.
//За основу можно взять любой алгоритм (например, https://dev.to/brunooliveira/writing-a-mathematical-expression-evaluator-in-java-1ka6), либо разработать собственный.

//Для тестирования корректности можно использовать минимум три выражения (x=10).

// 10*5+4/2-1 (результат 51)
// (x*3-5)/5 (результат 5)
// 3*x+15/(3+2) (результат 33)
// Опционально можно сделать поддержку отрицательных констант с унарным минусом.

import 'dart:ffi';

class Converter {
  String mathString = '';

  Converter(String text) {
    mathString = text;
  }

  double convert([Map<String, num> map = const {}]) {
    double result = 0;
    var (operands, numbers) = analyze(mathString, map);

    print('analyzed: $operands $numbers');
    return result;
  }

  (List, List) analyze(String s, [Map<String, num> map = const {}]) {
    const String operands = '()*/+-';
    bool isStringHasVariables = map.isEmpty;

    List<String> operandsInString = [];
    List<num> numbersInString = [];

    for (var i = 0; i < s.length; i++) {
      print(s[i]);
      if (operands.contains(s[i])) {
        operandsInString.add(s[i]);
      } else {
        numbersInString.add(int.parse(s[i]));  
      }
    }

    print('operandsInString: $operandsInString');
    print('numbersInString: $numbersInString');
    return (operandsInString, numbersInString);
  }

  /* TODO
    +
    -
    *
    /
    pi
    e
    variables
    ()
  */
}

void main() {
  print('hello there!\n');
  final first = Converter('1+2');
  print(first);
  print(first.convert({'x': 1}));

  // print(someStringConverter.convert(map))
}
