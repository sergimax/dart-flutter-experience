import 'package:dart_project/enum_symbol_type.dart';

class Node {
  late TokenType nodeType;
  List<Node> arguments = [];

  Node(TokenType type);
  Node.unary(TokenType type, Node argument) {
    nodeType = type;
    arguments.add(argument);
  }
  Node.binary(TokenType type, Node argumentA, Node argumentB) {
    nodeType = type;
    arguments.add(argumentA);
    arguments.add(argumentB);
  }

  List<Node> getLinePart() {
    return arguments;
  }
  
  TokenType getNodeType() {
    return nodeType;
  }

  void printValues() {
    print('${nodeType.name} $arguments');
  }
}
