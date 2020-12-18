import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Latihan Image"),),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            padding: EdgeInsets.all(3),
            child: Image(
              image: AssetImage("assets/juan.jpg"),
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat
            ),
          ),
        ),
      ),
    );
  }
}

