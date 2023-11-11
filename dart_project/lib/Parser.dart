import 'package:dart_project/Node.dart';
import 'package:dart_project/enum_symbol_type.dart';

class Parser {
  String unparsedLine;
  int cursor = 0;
  Parser(this.unparsedLine);
  // Node parse();
  String parseToken() {
    if (isDigit(unparsedLine[cursor])) {
      String value = '';
      while (isDigit(unparsedLine[cursor])) {
          value += unparsedLine[cursor];
          cursor++;
      }
      return value;
    }


    return '';
  }
  // Node parseUnary();
  // Node parseBinary();

  bool isDigit(String value) {
    return num.tryParse(value) != null;
  }

  TokenType getSymbolType(String symbol) {
    switch (symbol) {
      case '+':
        return TokenType.addition;
      case '-':
        return TokenType.subtraction;
      case '*':
        return TokenType.multiplication;
      case '/':
        return TokenType.division;
      default:
        return TokenType.value;
    }
  }
}
