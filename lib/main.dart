import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
      indicator: BoxDecoration(
        color: Colors.orange,
        border: Border(
          bottom: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      tabs: [
        Tab(
          icon: Icon(Icons.home),
          text: "Home",
        ),
        Tab(
          icon: Icon(Icons.explore),
          text: "Discover",
        ),
      ],
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Learning Tab Bar"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
              child: Container(
                color: Colors.yellow,
                child: myTabBar,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Tab 1")),
              Center(child: Text("Tab 2")),
            ],
          ),
        ),
      ),
    );
  }
}
