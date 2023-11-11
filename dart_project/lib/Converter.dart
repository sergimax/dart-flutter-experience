import 'package:dart_project/enum_symbol_type.dart';
import 'package:palestine_console/palestine_console.dart';

class Converter {
  /**
   * TODO действия:
   * - сложения
   * - вычитания
   * - умножения
   * - деления
   */

  /**
   * TODO должны поддерживаться:
   * - числовые константы
   * - именованные переменные
   * - скобки
   */

  String line = '';

  Converter(this.line);

  double convert([Map<String, int>? variables]) {
    Print.red(line);
    _analyze(line);

    return 0.0;
  }

  void _analyze(String expression) {
    Print.blue(expression);
    for (var i = 0; i < expression.length; i++) {
      String symbol = expression[i];
      Print.red(symbol);
      SymbolType type = getSymbolType(symbol);
      if (type == SymbolType.value) {
        Print.green('value');
      }
    }
  }

  SymbolType getSymbolType(String symbol) {
    switch (symbol) {
      case '+':
        return SymbolType.addition;
      case '-':
        return SymbolType.addition;
      case '*':
        return SymbolType.addition;
      case '/':
        return SymbolType.addition;
      default:
        return SymbolType.value;
    }
  }
}
