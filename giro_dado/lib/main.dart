/*
Nombre: Rosendo Eden Mendoza Casarrubia
Descripción: Aplicación que utiliza una secuencia animada de imágenes que cambian rápidamente para crear la ilusión 
de movimiento giratorio, culminando con un resultado aleatorio entre 1 y 6 generado mediante la clase Random de Dart
*/
// Importa los paquetes fundamentales de Flutter y Dart
import 'package:flutter/material.dart'; // Para widgets y diseño Material
import 'dart:math'; // Para generar números aleatorios (clase Random)
import 'dart:async'; // Para programación asíncrona (Future, Timer)

// Punto de entrada principal, esta es necesaria para toda aplicación Flutter
void main() {
  // Inicia la aplicación con el widget raíz MyApp
  runApp(
    const MyApp(), // Widget principal que contiene toda la app
  );
}

// Widget raíz sin estado (Stateless) que configura la app básica
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Key para identificación en el árbol de widgets

  // Método obligatorio que construye la interfaz
  @override
  Widget build(BuildContext context) {
    // MaterialApp es el contenedor del diseño Material Design
    return const MaterialApp(
      home: HomeDado(), // Define la pantalla inicial de la aplicación
    );
  }
}

// Widget con estado (Stateful) que gestionará el dado interactivo
class HomeDado extends StatefulWidget {
  const HomeDado({super.key}); 

  // Crea el estado mutable asociado a este widget
  @override
  State<HomeDado> createState() {
    return _HomeDadoState(); // Retorna una instancia del estado
  }
}

// Clase privada (por el _) que maneja el estado y lógica del widget
class _HomeDadoState extends State<HomeDado> {
  var _rutaDado = 'assets/images/dado1.png'; // Ruta de imagen actual
  var _i = 1; // Valor numérico actual del dado
  var _estaAnimado = false; // Bandera para controlar estado de animación

  // Método asíncrono para manejar la animación del dado
  Future<void> girarDado() async {
    print("Bandera:  $_estaAnimado");
    
    // Solo ejecuta si no hay animación en curso
    if (!_estaAnimado) {
      _estaAnimado = true; // Activa bloqueo para prevenir múltiples ejecuciones
      
      // Lista de imágenes para simular rotación
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
        'assets/images/dado1.png', // Repetición para suavizar parada
      ];

      // Duración entre cada cambio de imagen (100ms = 0.1 segundos)
      var duracion = const Duration(milliseconds: 100);

      // Bucle que recorre todas las imágenes para la animación
      for (var dado in listaDados) {
        // Actualiza la interfaz con cada nueva imagen
        setState(() {
          _rutaDado = dado; // Cambia la ruta de la imagen mostrada
        });
        // Pausa la ejecución sin bloquear el hilo principal
        await Future.delayed(duracion); // Espera el tiempo definido
      }

      // actualiza con resultado aleatorio
      setState(() {
        _i = Random().nextInt(6) + 1; // Genera número entre 1-6
        _rutaDado = 'assets/images/dado$_i.png'; // Actualiza imagen final
        _estaAnimado = false; // Libera el bloqueo para nuevas interacciones
      });
    }
  }

  // Método build: construye la interfaz cada vez que hay cambios de estado
  @override
  Widget build(BuildContext context) {
    // Scaffold provee la estructura básica de una pantalla
    return Scaffold(
      // Contenedor personalizable para el fondo
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient( // Gradiente radial circular
          colors: [Colors.red, Colors.blue], // Colores a mezclar
          radius: 1.5, // Radio mayor a 1 para expandir el gradiente
        )),
        // Centra todo el contenido vertical y horizontalmente
        child: Center(
          // Columna para organizar elementos verticalmente
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
            children: [
              // Widget para mostrar imágenes desde assets
              Image.asset(
                _rutaDado, // Ruta dinámica basada en el estado
                width: 150, // Ancho fijo para la imagen
              ),
              // Espaciador vertical
              const SizedBox(height: 15),
              Text(
                'Cara del dado: $_i', // Texto que muestra el valor numérico actual
                style: const TextStyle(fontSize: 20), // Estilo de texto
              ),
              // espaciador vertical
              const SizedBox(
                height: 15,
              ),
              // Botón con icono integrado
              ElevatedButton.icon(
                onPressed: girarDado, // Asigna función manejadora
                icon: const Icon(Icons.refresh), // Icono de material
                label: const Text("Girar dado"), // Texto del botón
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color de fondo
                  foregroundColor: Colors.white, // Color de texto/icono
                  textStyle: const TextStyle(fontSize: 20), // Tamaño texto
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}