import 'package:flutter/material.dart';


class MyWidgetCenter extends StatelessWidget {
  const MyWidgetCenter(this.text,{
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 30,
        ),
      ),
    );
  }
}