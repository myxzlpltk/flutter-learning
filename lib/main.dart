import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Learning Row and Column")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Text1"),
            Text("Text2"),
            Text("Text3"),
            Row(
              children: <Widget>[
                Text("Text4"),
                Text("Text5"),
                Text("Text6"),
              ],
            )
          ],
        )
      ),
    );
  }

}