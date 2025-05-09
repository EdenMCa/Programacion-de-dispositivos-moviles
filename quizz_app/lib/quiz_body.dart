import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

// Widget Stateful para manejar la pantalla de preguntas del quiz
class QuizBody extends StatefulWidget {
  const QuizBody({super.key, required this.addSelectAnswer}); // Función callback para enviar respuestas
  final void Function(String) addSelectAnswer; // Recibe la respuesta como String


  @override
  State<QuizBody> createState() => _QuizBodyState();  // Crea el estado asociado
}

// Clase de estado que maneja la lógica de las preguntas
class _QuizBodyState extends State<QuizBody> {
  int _questionNumber = 0; // Índice de la pregunta actual (comienza en 0)


  // Método que se ejecuta al seleccionar una respuesta
  void onSelectedAnswer(String answer) {
    widget.addSelectAnswer(answer); // Envía la respuesta al padre
    setState(() {
      _questionNumber++; // Avanza a la siguiente pregunta
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = listQuestions[_questionNumber]; // Obtiene pregunta actual
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget para mostrar el texto de la pregunta
              Text(
                currentQuestion.textQuestion,
                style: const TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              // Mapeo de las respuestas a botones
              ...currentQuestion.answers.map((answer) {
                return Column(children: [
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        onSelectedAnswer(answer); // Maneja selección
                      },
                      child: Text(answer)),
                ]);
              })
            ],
          ),
        ),
      ),
    );
  }
}
