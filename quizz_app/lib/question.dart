// Clase que representa una pregunta del quiz
class Question {
  // Constructor con parámetros requeridos
  const Question({
    required this.textQuestion,  // Texto de la pregunta
    required this.answers,       // Lista de respuestas posibles
    required this.correctAnswer  // Respuesta correcta
  });

  // Variables finales (inmutables después de la creación)
  final String textQuestion;     // Texto de la pregunta
  final List<String> answers;    // Opciones de respuesta
  final String correctAnswer;    // Respuesta correcta

  // Método para mezclar las respuestas (evita orden predecible)
  List<String> shuffleAnswers() {
    final copyOfList = List.of(answers);  // Crea copia de la lista original
    copyOfList.shuffle();                 // Mezcla la copia aleatoriamente
    return copyOfList;                    // Devuelve la lista mezclada
  }
}

// Lista constante de preguntas (datos del quiz)
const listQuestions = [
  Question(
    textQuestion: "¿Cuántos campeonatos tiene Lewis Hamilton?",
    answers: ["1", "4", "7", "8"],
    correctAnswer: "7",  // Lewis Hamilton tiene 7 títulos (hasta 2023)
  ),
  Question(
    textQuestion: "¿Quién es el piloto más joven en ganar un Gran Premio de F1?",
    answers: ["Max Verstappen", "Sebastian Vettel", "Fernando Alonso", "Lewis Hamilton"],
    correctAnswer: "Max Verstappen",  // Ganó a los 18 años en 2016
  ),
  Question(
    textQuestion: "¿Qué piloto ha ganado más carreras en la historia de la F1?",
    answers: ["Michael Schumacher", "Lewis Hamilton", "Sebastian Vettel", "Ayrton Senna"],
    correctAnswer: "Lewis Hamilton",  // Récord actual de victorias
  ),
  Question(
    textQuestion: "¿Qué equipo ha ganado más campeonatos de constructores en la F1?",
    answers: ["Ferrari", "McLaren", "Mercedes", "Williams"],
    correctAnswer: "Ferrari",  // 16 títulos de constructores
  ),
];