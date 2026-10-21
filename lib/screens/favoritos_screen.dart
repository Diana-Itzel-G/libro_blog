import 'package:flutter/material.dart';
import '../models/libro.dart';
import '../services/favoritos_service.dart';
import '../services/libro_service.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/libro_card.dart';
import 'detalle_screen.dart';

/// Pantalla 4: libros marcados como favoritos.
class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder<List<Libro>>(
        future: LibroService.cargarLibros(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final libros = snapshot.data!;

          // Se reconstruye cada vez que cambian los favoritos
          return ValueListenableBuilder<Set<int>>(
            valueListenable: FavoritosService.ids,
            builder: (context, ids, _) {
              final favoritos =
                  libros.where((libro) => ids.contains(libro.id)).toList();

              if (favoritos.isEmpty) {
                return const EstadoVacio(
                  icono: Icons.favorite_border_rounded,
                  titulo: 'Aún no tienes favoritos',
                  mensaje: 'Toca el corazón en cualquier libro para guardarlo aquí.',
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: favoritos.length,
                itemBuilder: (context, indice) {
                  final libro = favoritos[indice];
                  return LibroCard(
                    libro: libro,
                    onTap: () {
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
          );
        },
      ),
    );
  }
}
