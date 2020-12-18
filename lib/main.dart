import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Latihan Text Style"),
          ),
          body: Center(
            child: Text(
              "Ini adalah Text",
              style: TextStyle(
                fontFamily: "JetBrainsMono",
                fontStyle: FontStyle.italic,
                fontSize: 30,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationThickness: 3,
                decorationStyle: TextDecorationStyle.wavy
              ),
            ),
          )),
    );
  }
}
