import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeDado(),
    );
  }
}

class HomeDado extends StatefulWidget {
  const HomeDado({super.key});
  @override
  State<HomeDado> createState() {
    return _HomeDadoState();
  }
}

class _HomeDadoState extends State<HomeDado> {
  var rutaDado = 'assets/images/dado1.png';

  void girarDado(){
    setState(() {
      rutaDado = 'assets/images/dado5.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                rutaDado,
                width: 150,
              ),
              const SizedBox(height: 15),
              const Text(
                "Cara del dado: 1",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: girarDado,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  "Girar dado",
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
