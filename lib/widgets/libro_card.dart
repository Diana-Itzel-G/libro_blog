import 'package:flutter/material.dart';
import '../models/libro.dart';
import '../tema.dart';
import 'boton_favorito.dart';
import 'calificacion_estrellas.dart';
import 'etiqueta_chip.dart';
import 'portada_imagen.dart';

/// Tarjeta de un libro para las listas.
class LibroCard extends StatelessWidget {
  final Libro libro;
  final VoidCallback onTap;

  const LibroCard({super.key, required this.libro, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Colores.borde),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PortadaImagen(url: libro.portada, ancho: 78, alto: 108),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EtiquetaChip(texto: libro.genero),
                    const SizedBox(height: 6),
                    Text(
                      libro.titulo,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      libro.autor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colores.textoSuave),
                    ),
                    const SizedBox(height: 8),
                    CalificacionEstrellas(valor: libro.calificacion, tamano: 16),
                  ],
                ),
              ),
              BotonFavorito(libroId: libro.id),
            ],
          ),
        ),
      ),
    );
  }
}
