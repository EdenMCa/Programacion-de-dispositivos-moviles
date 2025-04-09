import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
            colors: [Colors.red, Colors.blue],
            radius: 1.5,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/dado1.png",
                  width: 150,
                ),
                const Text(
                  "Cara del dado: 1", style: TextStyle(fontSize: 20),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      (print("Boton 'Girar' presionado"));
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text("Girar", style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
