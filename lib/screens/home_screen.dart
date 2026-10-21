import 'package:flutter/material.dart';
import '../models/libro.dart';
import '../services/libro_service.dart';
import '../tema.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/libro_card.dart';
import 'acerca_screen.dart';
import 'detalle_screen.dart';
import 'favoritos_screen.dart';

/// Pantalla 2: lista de todas las resenas, cargadas desde el JSON.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // El Future se crea una sola vez, asi el JSON no se vuelve a leer en cada rebuild
  late final Future<List<Libro>> _futuroLibros;

  @override
  void initState() {
    super.initState();
    _futuroLibros = LibroService.cargarLibros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Libro Blog',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            tooltip: 'Favoritos',
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritosScreen(),
                ),
              );
            },
          ),
          IconButton(
            tooltip: 'Acerca del blog',
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AcercaScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Libro>>(
        future: _futuroLibros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return const EstadoVacio(
              icono: Icons.error_outline_rounded,
              titulo: 'No pudimos cargar los libros',
              mensaje: 'Revisa que assets/libros.json exista en pubspec.yaml.',
            );
          }

          final libros = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: libros.length + 1, // +1 por el encabezado
            itemBuilder: (context, indice) {
              if (indice == 0) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: Text(
                    '¿Qué historia leemos hoy?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colores.texto,
                    ),
                  ),
                );
              }
              final libro = libros[indice - 1];
              return LibroCard(
                libro: libro,
                onTap: () {
                  // Navegamos al detalle pasando el OBJETO completo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleScreen(libro: libro),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
