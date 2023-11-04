// Необходимо разработать алгоритм на Dart для интерпретации математических выражений (действия сложения, вычитания, умножения, деления, должны поддерживаться числовые константы и именованные переменные, а также скобки).
// Преобразователь должен быть оформлен как класс (конструктор принимает строку с математической функций) с функцией преобразования, принимающей Map с переменными (ключ - название переменной, значение - числовое значение, которое подставляется вместо переменной) и возвращающей значение типа double.
//При вычислении значения выражения необходимо учитывать приоритет математических операций.
//За основу можно взять любой алгоритм (например, https://dev.to/brunooliveira/writing-a-mathematical-expression-evaluator-in-java-1ka6), либо разработать собственный.

//Для тестирования корректности можно использовать минимум три выражения (x=10).

// 10*5+4/2-1 (результат 51)
// (x*3-5)/5 (результат 5)
// 3*x+15/(3+2) (результат 33)
// Опционально можно сделать поддержку отрицательных констант с унарным минусом.

enum NodeType {
  operation,
  constant,
  variable
}

class Node {

}

class Converter {
  String mathString = '';
  // TODO operations + - * /
  final Map<String, Function> possibleOperations = {
    '*': (first, second) => first * second,
    '/': (first, second) => first / second,
    '+': (first, second) => first + second,
    '-': (first, second) => first - second,
  };
  // TODO ()

  Converter(String text) {
    mathString = text;
  }

  double convert([Map<String, num> map = const {}]) {
    double result = 0;
    // var (operations, numbers) = analyze(mathString, map);

    List expressionInPolishNotation = convertToPolishNotation(mathString);
    print('expressionInPolishNotation: ${expressionInPolishNotation}');

    // result = execute(operations, numbers);
    print('result $result');

    return result;
  }

  double execute(List operations, List operands, [bool isPrioritised = false]) {
    double result = 0;

    while (operands.length > 1) {
      possibleOperations.forEach((key, value) {
        print(key);
        var indexOfOperation = operations.indexOf(key);
        if (indexOfOperation != -1) {
          operands[indexOfOperation] =
              value(operands[indexOfOperation], operands[indexOfOperation + 1]);
          operands.removeAt(indexOfOperation + 1);
          operations.removeAt(indexOfOperation);
        }
      });
    }
    print(operands[0]);
    result = operands[0] * 1.0;
    return result;
  }

  (List, List) analyze(String s, [Map<String, num> map = const {}]) {
    // TODO variables
    // bool isStringHasVariables = map.isEmpty;
    // TODO constants - pi, e

    List<String> operationsInString = [];
    List<num> numbersInString = [];

    String numberPart = '';
    for (var i = 0; i < s.length; i++) {
      // TODO numbers addition as function
      if (possibleOperations.containsKey(s[i])) {
        if (numberPart.isNotEmpty) {
          numbersInString.add(int.parse(numberPart));
          numberPart = '';
        }

        operationsInString.add(s[i]);
      } else if (s[i] == '(' || s[i] == ')') {
        operationsInString.add(s[i]);

        if (numberPart.isNotEmpty) {
          numbersInString.add(int.parse(numberPart));
          numberPart = '';
        }
      } else {
        numberPart += s[i];
        if (i + 1 == s.length) {
          numbersInString.add(int.parse(numberPart));
          numberPart = '';
        }
      }
    }

    print(
        'operationsInString: \t ${operationsInString.length} \t $operationsInString');
    print('numbersInString: \t ${numbersInString.length} \t $numbersInString');
    return (operationsInString, numbersInString);
  }

  List convertToPolishNotation(String expression) {
    List result = [];
    expression = '(' + expression + ')';
    print(expression);
    String numberPart = '';
    int priorityLevel = 0;
    List stack = [];

    bool addNumber(String part) {
      if (numberPart.isEmpty) return false; 
      // result.add(part);
      numberPart = '';
      stack.add(part);
      return true;
    }

    for (var i = 0; i < expression.length; i++) {
      print('');
      var symbol = expression[i];
      
      if (!'+-/*()'.contains(symbol)) {
        print('${symbol} \tnumber');
        numberPart += symbol;
        if (i + 1 == expression.length || '+-/*()'.contains(expression[i+1])) {
          addNumber(numberPart);
        }
      }
      
      else if (symbol == '(') {
        print('${symbol} \topen bracket');
        priorityLevel++;
      }

      else if (symbol == ')') {
        priorityLevel--;
        print('${symbol} \tclose bracket');
      }

      else {
        print('${symbol} \toperation');
        result.add(symbol);
        // stack.add(symbol);
      }

      print('${stack} ${result}');
    }

    print(stack.join(''));
    print(result.join(','));
    return result;
  }
}
void main() {
  final first = Converter('10+2*3');
  first.convert({'x': 1});
  // print(someStringConverter.convert(map))
}
