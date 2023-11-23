import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
      const Example()
  );
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
        child: Directionality(
          child: Text('Hello'),
          textDirection: TextDirection.ltr,
        )
      )
    );
  }
}

