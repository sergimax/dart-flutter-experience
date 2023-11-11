import 'package:dart_project/enum_symbol_type.dart';

class Node {
  late String token;
  List<Node> arguments = [];

  Node(String type);
  Node.unary(String type, Node argument) {
    token = type;
    arguments.add(argument);
  }
  Node.binary(String type, Node argumentA, Node argumentB) {
    token = type;
    arguments.add(argumentA);
    arguments.add(argumentB);
  }

  List<Node> getLinePart() {
    return arguments;
  }
  
  String getNodeType() {
    return token;
  }

  void printValues() {
    print('${token} $arguments');
  }
}
