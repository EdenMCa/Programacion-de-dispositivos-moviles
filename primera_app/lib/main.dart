import 'package:flutter/material.dart';
import 'package:primera_app/My_Widget.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    backgroundColor: Color.fromARGB(255, 151, 126, 126), //
    body: MyWidget2(
      Colors.red,
      Colors.blue,
    ),
  )));
}
