/*
Rosendo Eden Mendoza Casarrubia
Examen del Primer parcial 
31/03/2025
*/
import 'package:english_words/english_words.dart'; // Importa el paquete que genera pares de palabras en inglés.
import 'package:flutter/material.dart'; // Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:provider/provider.dart'; // Importa Provider para la gestión del estado.

void main() {
  runApp(MyApp()); // Punto de entrada: inicia la aplicación.
}

// Widget principal de la aplicación, sin estado.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Se provee una instancia de MyAppState a toda la aplicación.
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'mi_app',
        theme: ThemeData(
          // Define el tema de la aplicación usando un color basado en una semilla.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, //Se cambio el color a azul
          ),
        ),
        home: MyHomePage(), // Establece la página de inicio.
      ),
    );
  }
}

// Clase que gestiona el estado de la aplicación.
class MyAppState extends ChangeNotifier {
  // Almacena el par de palabras actual, generado de forma aleatoria.
  var current = WordPair.random();

  // Método para generar un nuevo par de palabras.
  void getNext() {
    current = WordPair.random();
    notifyListeners(); // Notifica a los widgets que están escuchando este estado.
  }

  // Lista que almacena los pares de palabras favoritos.
  var favorites = <WordPair>[];

  // Método para alternar (añadir o quitar) el par actual en la lista de favoritos.
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current); // Se elimina si ya está en favoritos.
    } else {
      favorites.add(current); // Se añade si no está en favoritos.
    }
    notifyListeners(); // Notifica a los widgets para actualizar la interfaz.
  }
}

// Widget con estado que representa la página principal de la aplicación.
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Estado de MyHomePage, controla la navegación entre páginas.
class _MyHomePageState extends State<MyHomePage> {
  // Variable que determina qué página se muestra: 0 para "Home" y 1 para "Favorites".
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    // Se elige la página a mostrar según el índice seleccionado.
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(); // Página para generar nuevos pares de palabras.
        break;
      case 1:
        page = FavoritesPage(); // Página que muestra la lista de favoritos.
        break;
      default:
        throw UnimplementedError(
            'no widget for $selectedIndex'); // Si el índice no es válido.
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          // La interfaz se divide en una fila con dos secciones: navegación y contenido.
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  // Muestra los textos junto a los iconos si la pantalla es lo suficientemente ancha.
                  extended: constraints.maxWidth >= 600,
                  // Destinos de la barra de navegación.
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex:
                      selectedIndex, // Índice actualmente seleccionado.
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex =
                          value; // Actualiza el índice al seleccionar una opción.
                    });
                  },
                ),
              ),
              Expanded(
                // Área principal donde se muestra la página correspondiente.
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Página que genera y muestra un par de palabras.
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Se accede al estado de la aplicación para obtener el par actual y los favoritos.
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // Se define el icono a mostrar dependiendo si el par ya está en la lista de favoritos.
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite; // Icono de corazón lleno si es favorito.
    } else {
      icon = Icons.favorite_border; // Icono de corazón vacío si no es favorito.
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(
              pair: pair), // Muestra el par de palabras en una tarjeta grande.
          SizedBox(height: 10), // Espacio vertical.
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState
                      .toggleFavorite(); // Se alterna el estado de favorito.
                },
                icon: Icon(icon),
                label: Text('Me gusta'), //Se cambio el texto a Me gusta
              ),
              SizedBox(width: 10), // Espacio horizontal entre botones.
              ElevatedButton(
                onPressed: () {
                  appState.getNext(); // Se genera un nuevo par de palabras.
                },
                child: Text('Siguiente'), //Se cambio el texto a Siguiente
              ),
              //Se agrego el boton "Imprimir en consola"
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  print('Botón presionado');
                },
                child: Text('Imprimir'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget que muestra un par de palabras en una tarjeta estilizada.
class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  // El par de palabras a mostrar.
  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Se define el estilo de texto basado en el tema actual.
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSecondary,//Se cambio el color onPrimary a onSecondary.
    );

    return Card(
      color: theme.colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(50), // Espacio interno en la tarjeta.
        child: Text(
          pair.asLowerCase, // Muestra el par de palabras en minúsculas.
          style: style,
          // Etiqueta para mejorar la accesibilidad, separa las palabras.
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

// Página que muestra la lista de pares de palabras favoritos.
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Se accede a la lista de favoritos desde el estado de la aplicación.
    var appState = context.watch<MyAppState>();

    // Si la lista de favoritos está vacía, se muestra un mensaje.
    if (appState.favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }

    // Si hay elementos en la lista, se muestra una lista (ListView) con cada favorito.
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have ${appState.favorites.length} favorites:',
          ),
        ),
        // Se recorre cada par en la lista de favoritos para crear un ListTile.
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons
                .favorite), // Icono de corazón para indicar que es favorito.
            title: Text(pair.asLowerCase), // Muestra el par de palabras.
          ),
      ],
    );
  }
}
