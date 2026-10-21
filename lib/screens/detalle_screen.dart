import 'package:flutter/material.dart';
import '../models/libro.dart';
import '../tema.dart';
import '../widgets/boton_accion.dart';
import '../widgets/boton_favorito.dart';
import '../widgets/calificacion_estrellas.dart';
import '../widgets/dato_libro.dart';
import '../widgets/etiqueta_chip.dart';
import '../widgets/parrafo_texto.dart';
import '../widgets/portada_imagen.dart';
import '../widgets/titulo_seccion.dart';

/// Pantalla 3: detalle de una resena. Recibe el libro completo por constructor.
class DetalleScreen extends StatelessWidget {
  final Libro libro;

  const DetalleScreen({super.key, required this.libro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CustomScrollView permite el SliverAppBar con imagen grande
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: Colores.fondo,
            foregroundColor: Colores.texto,
            actions: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: CircleAvatar(
                  backgroundColor: const Color(0x66000000),
                  child: BotonFavorito(
                    libroId: libro.id,
                    colorInactivo: Colors.white,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: PortadaImagen(url: libro.portada, radio: 0),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    libro.titulo,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'por ${libro.autor}',
                    style: const TextStyle(color: Colores.textoSuave),
                  ),
                  const SizedBox(height: 12),
                  CalificacionEstrellas(valor: libro.calificacion, tamano: 22),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DatoLibro(
                        icono: Icons.menu_book_rounded,
                        valor: '${libro.paginas}',
                        etiqueta: 'páginas',
                      ),
                      DatoLibro(
                        icono: Icons.category_rounded,
                        valor: libro.genero,
                        etiqueta: 'género',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: libro.etiquetas
                        .map((etiqueta) => EtiquetaChip(texto: etiqueta))
                        .toList(),
                  ),
                  const TituloSeccion(texto: 'Sinopsis'),
                  ParrafoTexto(texto: libro.sinopsis),
                  const TituloSeccion(texto: 'Mi reseña'),
                  ParrafoTexto(texto: libro.resenia),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: BotonAccion(
                      texto: 'Volver',
                      icono: Icons.arrow_back_rounded,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
