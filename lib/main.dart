import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isStop = true;
  int counter = 0;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Timer")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: color
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Direct"),
                onPressed: (){
                  Timer.run(() {
                    setState(() {
                      if(color == Colors.black)
                        color = Colors.red;
                      else
                        color = Colors.black;
                    });
                  });
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Delay"),
                onPressed: (){
                  Timer(Duration(seconds: 5), (){
                    setState(() {
                      if(color == Colors.black)
                        color = Colors.red;
                      else
                        color = Colors.black;
                    });
                  });
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Start Timer"),
                onPressed: (){
                  isStop = false;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if(isStop) timer.cancel();

                    setState(() {
                      counter += 1;
                    });
                  });
                },
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Stop Timer"),
                onPressed: (){
                  setState(() {
                    isStop = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
