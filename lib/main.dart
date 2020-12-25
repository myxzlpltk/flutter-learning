import 'package:flutter/material.dart';
import 'package:learn_flutter/colorful_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Colorful Button")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorfulButton(Colors.pink, Colors.red, Icons.home),
              ColorfulButton(Colors.lightBlue, Colors.blue, Icons.explore),
              ColorfulButton(Colors.yellow, Colors.orange, Icons.notifications),
              ColorfulButton(Colors.greenAccent, Colors.green, Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
