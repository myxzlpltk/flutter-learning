import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Latihan Stack dan Align"),
          ),
          body: Stack(
            children: [
              // Background
              Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.cyan,
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.red,
                              ))
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.yellow,
                              )),
                          Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.black,
                              ))
                        ],
                      )),
                ],
              ),
              // ListView
              ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        "Ini adalah teks yang ada di lapisan tengah dari Stack.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "Ini adalah teks yang ada di lapisan tengah dari Stack.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "Ini adalah teks yang ada di lapisan tengah dari Stack.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  )
                ],
              ),
              // Button di Tengah
              Align(
                alignment: Alignment(0, 0.9),
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("My Button"),
                  color: Colors.blue,
                ),
              )
            ],
          )),
    );
  }
}
