import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends Bloc<ColorEvent, Color>{

  Color _color = Colors.amber;

  ColorBloc() : super(Colors.amber);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.toAmber) ? Colors.amber : Colors.lightBlue;
    yield _color;
  }

}