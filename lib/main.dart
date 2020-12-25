import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learn_flutter/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("API Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((postResult != null) ? postResult.id + " | " + postResult.name + " | " + postResult.job : "Tidak ada data"),
              RaisedButton(
                onPressed: () {
                  PostResult.connectToAPI("Juan", "Student").then((value){
                    setState(() {
                      postResult = value;
                    });
                  });
                },
                child: Text("POST"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
