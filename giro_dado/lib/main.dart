import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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
  var _rutaDado = 'assets/images/dado1.png';
  var _i = 1;
  var _estaAnimado = false;

  Future<void> girarDado() async {
    print("Bandera:  $_estaAnimado");
    if (!_estaAnimado) {
      _estaAnimado = true;
      List<String> listaDados = [
        'assets/images/dado1.png',
        'assets/images/dado5.png',
        'assets/images/dado2.png',
        'assets/images/dado4.png',
        'assets/images/dado3.png',
        'assets/images/dado6.png',        
        'assets/images/dado1.png',
        'assets/images/dado5.png',
        'assets/images/dado2.png',
        'assets/images/dado4.png',
        'assets/images/dado3.png',
        'assets/images/dado6.png',
        'assets/images/dado1.png',
        'assets/images/dado5.png',
        'assets/images/dado2.png',
        'assets/images/dado4.png',
        'assets/images/dado3.png',
        'assets/images/dado6.png',        
        'assets/images/dado1.png',
        'assets/images/dado5.png',
        'assets/images/dado2.png',
        'assets/images/dado4.png',
        'assets/images/dado3.png',
        'assets/images/dado6.png',
        'assets/images/dado1.png',
        'assets/images/dado5.png',
        'assets/images/dado2.png',
        'assets/images/dado4.png',
        'assets/images/dado3.png',
        'assets/images/dado6.png',
      ];

      var duracion = const Duration(microseconds: 200);

      for (var dado in listaDados) {
        setState(() {
          _rutaDado = dado;
        });
        await Future.delayed(duracion);
      }

        setState(() {
        _i = Random().nextInt(6) + 1;
        _rutaDado = 'assets/images/dado$_i.png';
        _estaAnimado = false;
      });
    }
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
                _rutaDado,
                width: 150,
              ),
              const SizedBox(height: 15),
              Text(
                'Cara del dado: $_i',
                style: const TextStyle(fontSize: 20),
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

//Repetir el mismo proyecto, pero en vez de girar el dado, sea seleccionar alumno