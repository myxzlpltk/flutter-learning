import 'package:flutter/material.dart';
import 'package:learn_flutter/second_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return SecondPage();
            }));
          },
          child: Text("Go To Second Page"),
        ),
      ),
    );
  }
}
