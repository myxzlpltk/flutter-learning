import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latihan Media Query"),),
      body: Container(
        width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height/2,
        color: Colors.red,
      ),
    );
  }
}
