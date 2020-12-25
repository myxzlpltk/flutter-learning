import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Gradient Opacity")),
        body: Center(
          child: ShaderMask(
            shaderCallback: (rectangle){
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent
                ],
              ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              width: 200,
              image: AssetImage("assets/juan.jpg"),
            ),
          )
        ),
      ),
    );
  }
}

