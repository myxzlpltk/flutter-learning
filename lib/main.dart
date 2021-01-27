import 'package:flutter/material.dart';
import 'package:learn_flutter/color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("BLoC tanpa Library"),),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: (){
                bloc.eventSink.add(ColorEvent.toAmber);
              },
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              onPressed: (){
                bloc.eventSink.add(ColorEvent.toLightBlue);
              },
            )
          ],
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                width: 100,
                height: 100,
                color: snapshot.data,
                duration: Duration(milliseconds: 500),
              );
            }
          ),
        ),
      ),
    );
  }

}
