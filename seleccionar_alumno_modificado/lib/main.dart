//Nombre: Rosendo Eden Mendoza Casarrubia 
//Descripción: Aplicación que selecciona la imagen de un alumno de forma aleatoria.


//Importaciones básicas para Flutter y funcionalidades Dart
import 'package:flutter/material.dart'; // Para widgets y Material Design
import 'dart:math'; // Para generar números aleatorios (clase Random)
import 'dart:async'; // Para operaciones asíncronas (Future, async/await)

// Punto de entrada principal de la aplicación
void main() {
  runApp(
    const MyApp(), // Inicializa la aplicación con el widget raíz
  );
}

// Widget raíz sin estado que configura la aplicación básica  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeImagen(), // Define la pantalla principal de la app
    );
  }
}

// Widget con estado para manejar la lógica de selección de alumnos
class HomeImagen extends StatefulWidget {
  const HomeImagen({super.key});

  @override
  State<HomeImagen> createState() => _HomeImagenState();
}

// Clase de estado que contiene la lógica y variables mutables
class _HomeImagenState extends State<HomeImagen> {
  // Variables de estado
  var _rutaImagen = 'assets/images/compa_1.jpeg'; // Ruta de imagen inicial
  var _i = 1; // Índice del alumno actual (1-7)
  var _estaAnimado = false; // Control de animación en progreso

  // Lista de nombres de alumnos 
  final List<String> _nombresAlumnos = [
    'Albert',
    'Kevin',
    'Elton',
    'Diana',
    'Eden',
    'Amelia',
    'Sergio' 
  ];

  // Método para simular la selección aleatoria con animación
  Future<void> girarImagen() async {
    print("Bandera:  $_estaAnimado");
    if (!_estaAnimado) { // Evita ejecuciones simultáneas
      _estaAnimado = true; // Activa bloqueo

      // Lista ordenada de imágenes para la animación
      List<String> listaImagen = [
        "assets/images/compa_1.jpeg",
        "assets/images/compa_2.jpeg",
        "assets/images/compa_3.jpeg",
        "assets/images/compa_4.jpeg",
        "assets/images/compa_5.jpeg",
        "assets/images/compa_6.jpeg",
        "assets/images/compa_7.jpeg"
      ];

      var duracion = const Duration(milliseconds: 100); // Velocidad de la transición

      // Recorre todas las imágenes para efecto de animación
      for (var imagen in listaImagen) {
        setState(() { 
          _rutaImagen = imagen; // Cambia la imagen mostrada
        });
        await Future.delayed(duracion); // Pausa entre cambios
      }

      // Selección final aleatoria
      setState(() {
        _i = Random().nextInt(7) + 1; // Genera número entre 1-7
        _rutaImagen = 'assets/images/compa_$_i.jpeg'; // Actualiza imagen final
        _estaAnimado = false;
      });
    }
  }

  // Construcción de la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient( // Fondo degradado
          colors: [Colors.red, Colors.blue], // Colores del gradiente
          radius: 1.5, // Tamaño del efecto radial
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
            children: [
              // Widget para mostrar la imagen del alumno
              Image.asset(
                _rutaImagen,
                width: 250, // Ancho fijo
                fit: BoxFit.cover, // Ajuste de imagen
              ),
              const SizedBox(height: 15), // Espaciador
              // Texto que muestra el nombre del alumno seleccionado
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'cd{_nombresAlumnos[_i - 1]}', 
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.95),
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      color: const Color.fromARGB(255, 250, 250, 250).withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
              const SizedBox(height: 15),
              // Botón para iniciar la selección
              ElevatedButton.icon(
                onPressed: girarImagen, // Asocia el método de acción
                icon: const Icon(Icons.refresh), // Icono de recarga
                label: const Text("Seleccionar ganador"), // Texto descriptivo
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color principal
                  foregroundColor: Colors.white, // Color de texto/icono
                  textStyle: const TextStyle(fontSize: 20), // Tamaño de fuente
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}