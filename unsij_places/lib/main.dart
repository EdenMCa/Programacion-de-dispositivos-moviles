import 'package:flutter/material.dart';
import 'configurations/app_theme.dart';
import 'screens/home_screen.dart';  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNSIJ_PLACES',
      theme: appTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false, 
    );
  }
}