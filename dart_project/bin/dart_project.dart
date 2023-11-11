import 'package:dart_project/Parser.dart';

void main() {
  Parser parser = Parser('10+2*3');
  print(parser.parseToken());
}
