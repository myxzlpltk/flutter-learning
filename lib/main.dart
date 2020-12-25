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
  String output = "no data";
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
              Text(output, textAlign: TextAlign.center),
              RaisedButton(
                onPressed: () {
                  User.getUsers("2").then((users) {
                    setState(() {
                      output = "";
                      for (int i = 0; i < users.length; i++) {
                        output = output + " [ " + users[i].name + " ] ";
                      }
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
