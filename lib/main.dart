import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Progress Bar")),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create: (context) => TimeState(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<TimeState>(
                  builder: (context, timeState, _) => CustomProgressBar(
                    width: 200,
                    value: timeState.time,
                  ),
                ),
                SizedBox(height: 10),
                Consumer<TimeState>(
                  builder: (context, timeState, _) => RaisedButton(
                    color: Colors.lightBlue,
                    child: Text("Start", style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      Timer.periodic(Duration(seconds: 1), (timer) {
                        if(timeState.time == 0) timer.cancel();
                        else timeState.time -= 1;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue = 15;

  const CustomProgressBar({Key key, this.width, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer, color: Colors.grey[700]),
        SizedBox(width: 5),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 3,
              child: AnimatedContainer(
                width: ratio * width,
                height: 10,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: (ratio < 0.3) ? Colors.red : (ratio < 0.6) ? Colors.orange : Colors.green ,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class TimeState with ChangeNotifier{
  int _time = 15;

  int get time => _time;
  set time(int value){
    _time = value;
    notifyListeners();
  }
}