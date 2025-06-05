/*
Nombre: Rosendo Eden Mendoza Casarrubia
Descripción: La aplicación es un quiz interactivo sobre Fórmula 1 que permite a los usuarios poner a prueba sus conocimientos sobre este deporte.
Esta aplicacion sigue la arquitectura estándar de widgets, implementando:
  - Pantallas dinámicas (Home, Preguntas y Resultados) gestionadas con StatefulWidget para manejar el estado.
  - Navegación entre pantallas mediante callbacks (VoidCallback y funciones personalizadas).
  - Estilos visuales atractivos, incluyendo gradientes (LinearGradient), tarjetas (Card) y botones personalizados (ElevatedButton).
  - Lógica de preguntas y respuestas con listas de objetos (Question), validación de respuestas correctas y un sistema de puntuación.
  - Feedback claro mediante colores (verde/rojo para aciertos/errores) y resultados detallados.
*/

// Importaciones principales de Flutter y archivos locales
import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/quiz_body.dart';
import 'package:quizz_app/results_screen.dart';

// Punto de entrada principal de la aplicación
void main() {
  runApp(const MyApp()); // Inicializa la aplicación con el widget raíz
}

// Widget principal de la aplicación (Stateful para manejar estado)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// Clase de estado que maneja la lógica principal de la aplicación
class _MyAppState extends State<MyApp> {
  String currentScreen = "home-screen"; // Controla la pantalla actual
  final List<String> SelectedAnswer =
      []; // Almacena las respuestas seleccionadas

  // Método para cambiar a la pantalla de preguntas
  void switchScreen() {
    setState(() {
      currentScreen = "question_screen";
      SelectedAnswer.clear(); // Limpia respuestas anteriores
    });
  }

  // Método para agregar una respuesta seleccionada
  void addSelectAnswer(String answer) {
    SelectedAnswer.add(answer); // Añade la respuesta a la lista

    // Si se respondieron todas las preguntas, va a resultados
    if (SelectedAnswer.length == listQuestions.length) {
      setState(() {
        currentScreen = "results_screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Pantalla inicial por defecto
    Widget screen = HomePage(startQuiz: switchScreen);

    // Cambia a pantalla de preguntas si corresponde
    if (currentScreen == "question_screen") {
      screen = QuizBody(addSelectAnswer: addSelectAnswer);
    }
    // Cambia a pantalla de resultados si corresponde
    else if (currentScreen == "results_screen") {
      screen = ResultsScreen(
        selectedAnswers: SelectedAnswer,
        onRestart: () {
          setState(() {
            currentScreen = "home-screen"; // Vuelve al inicio
            SelectedAnswer.clear(); // Limpia las respuestas
          });
        },
      );
    }

    // Configuración principal de la aplicación
    return MaterialApp(
      title: 'Quiz App', // Título de la app
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurpleAccent, // Color de fondo
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          textStyle: const TextStyle(fontSize: 20),
        ) // Estilo de botones
            ),
      ),
      home: screen, // Pantalla actual a mostrar
    );
  }
}

// Pantalla de inicio (Stateless Widget)
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.startQuiz});
  final void Function() startQuiz; // Callback para iniciar el quiz

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
          children: [
            // Imagen principal
            Image.asset(
              'assets/images/pngegg.png',
              width: 320, // Tamaño de la imagen
            ),
            const SizedBox(height: 20), // Espaciador
            // Botón de inicio
            ElevatedButton.icon(
              onPressed: startQuiz, // Llama a la función de inicio
              icon:
                  const Icon(Icons.play_circle_fill_outlined), // Ícono de play
              label: const Text("Iniciar"), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
