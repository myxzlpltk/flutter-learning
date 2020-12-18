import 'dart:async';
import 'dart:math';
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
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Latihan Animated Container"),
          ),
          body: Center(
            child: GestureDetector(
              onTap: (){
                setState(() {

                });
              },
              child: AnimatedContainer(
                color: Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256)),
                duration: Duration(seconds: 1),
                width: 50.0 + random.nextInt(101),
                height: 50.0 + random.nextInt(101),
              ),
            ),
          )
      ),
    );
  }
}
