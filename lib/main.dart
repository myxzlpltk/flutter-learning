import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Learning Tab Bar"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.explore),
                  text: "Discover",
                ),
                Tab(
                  icon: Icon(Icons.notifications),
                  text: "Notifications",
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: "Profil",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Tab 1")),
              Center(child: Text("Tab 2")),
              Center(child: Text("Tab 3")),
              Center(child: Text("Tab 4")),
            ],
          ),
        ),
      ),
    );
  }
}
