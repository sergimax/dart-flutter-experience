import 'package:palestine_console/palestine_console.dart';

class Converter {
  String line = '';

  Converter(){
    Print.red('Converter initialized');
  }

  void printLine(){
    Print.blue('$line');
  }
}
