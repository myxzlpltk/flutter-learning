import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter = ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(title: Text("Widgets Demo GDG 2019 China")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  showCursor: true,
                  cursorWidth: 3,
                  cursorColor: Colors.red,
                ),
                SizedBox(height: 10),
                ToggleButtons(
                  isSelected: isSelected,
                  children: [
                    Icon(Icons.access_alarm),
                    Icon(Icons.adb),
                    Icon(Icons.add_comment),
                  ],
                  onPressed: (index){
                    setState(() {
                      isSelected.fillRange(0, isSelected.length, false);
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.red,
                  splashColor: Colors.blue,
                  highlightColor: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
