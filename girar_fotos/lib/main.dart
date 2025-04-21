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
      home: HomeImagen(),
    );
  }
}

class HomeImagen extends StatefulWidget {
  const HomeImagen({super.key});
  @override
  State<HomeImagen> createState() {
    return _HomeImagenState();
  }
}

class _HomeImagenState extends State<HomeImagen> {
  var _rutaImagen = 'assets/images/compa_1.jpeg';
  var _i = 1;
  var _estaAnimado = false;

  Future<void> girarImagen() async {
    print("Bandera:  $_estaAnimado");
    if (!_estaAnimado) {
      _estaAnimado = true;
      List<String> listaImagen = [
        "assets/images/compa_1.jpeg",
        "assets/images/compa_2.jpeg",
        "assets/images/compa_3.jpeg",
        "assets/images/compa_4.jpeg",
        "assets/images/compa_5.jpeg",
        "assets/images/compa_6.jpeg",
        "assets/images/compa_7.jpeg"
      ];

      var duracion = const Duration(milliseconds: 200);

      for (var imagen in listaImagen) {
        setState(() {
          _rutaImagen = imagen;
        });
        await Future.delayed(duracion);
      }

      setState(() {
        _i = Random().nextInt(7) + 1;
        _rutaImagen = 'assets/images/compa_$_i.jpeg';
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
                _rutaImagen,
                width: 150,
              ),
              const SizedBox(height: 15),
              Text(
                'Imagen: $_i',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton.icon(
                onPressed: girarImagen,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  "Girar imagen",
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
