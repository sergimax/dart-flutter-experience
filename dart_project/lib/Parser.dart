import 'package:dart_project/Node.dart';
import 'package:dart_project/enum_symbol_type.dart';

class Parser {
  String unparsedLine;
  int cursor = 0;
  Parser(this.unparsedLine);

  void parse(){
    while (cursor < unparsedLine.length) {
      print(parseToken());
    }
  }

  String parseToken() {
    // print(unparsedLine[cursor]);
    
    if (isDigit(unparsedLine[cursor])) {
      String value = '';
      while (cursor < unparsedLine.length && isDigit(unparsedLine[cursor])) {
          value += unparsedLine[cursor];
          cursor++;
      }
      return value;
    }
    
    TokenType type = getSymbolType(unparsedLine[cursor]);
    cursor++;
    if (type != TokenType.unknown) {
      return type.name;
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
      case '(':
        return TokenType.openParenthesis;
      case ')':
        return TokenType.closedParenthesis;
      default:
        return TokenType.unknown;
    }
  }
}
