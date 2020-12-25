import 'package:flutter/material.dart';
import 'package:learn_flutter/post_result_model.dart';
import 'package:learn_flutter/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("API Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((user != null) ? user.id + " | " + user.name : "Tidak ada data"),
              RaisedButton(
                onPressed: () {
                  User.connectToAPI("3").then((value){
                    setState(() {
                      user = value;
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
