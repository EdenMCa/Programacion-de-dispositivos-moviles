import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

// Pantalla de resultados (StatelessWidget porque no necesita estado interno)
class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnswers;  // Lista de respuestas seleccionadas por el usuario
  final VoidCallback onRestart; // Función para reiniciar el quiz

  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  // Getter que calcula el número de respuestas correctas
  int get correctAnswers {
    int contador = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      // Compara cada respuesta con la correcta
      if (selectedAnswers[i] == listQuestions[i].correctAnswer) {
        contador++;
      }
    }
    return contador;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              // Lista de preguntas y respuestas
              Expanded(
                child: ListView.builder(
                  itemCount: selectedAnswers.length + 1, // +1 para el espacio del resultado
                  itemBuilder: (context, index) {
                    // Maneja el último índice como espacio vacío
                    if (index == selectedAnswers.length) {
                      // Espacio para el resultado
                      return Container();
                    }
                    
                    // Obtiene datos de la pregunta actual
                    final question = listQuestions[index];
                    final userAnswer = selectedAnswers[index];
                    final isCorrect = userAnswer == question.correctAnswer;

                    // Tarjeta por pregunta
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Texto de la pregunta
                            Text(
                              question.textQuestion,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Respuesta del usuario (verde/rojo según correcta)
                            Text(
                              'Tu respuesta: $userAnswer',
                              style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // Respuesta correcta (en gris)
                            Text(
                              'Correcta: ${question.correctAnswer}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Sección de resultados abajo de las preguntas
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Resultados: $correctAnswers/${listQuestions.length}',
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Botón de reinicio
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reintentar'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}