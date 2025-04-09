import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primera_app/My_Widget_Center.dart';

class MyWidget2 extends StatelessWidget {
  const MyWidget2(
    this.color1,
    this.color2,{
    super.key,
  });

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.5,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      child: const MyWidgetCenter("Hola! Soy Eden"),
    );
  }
}
