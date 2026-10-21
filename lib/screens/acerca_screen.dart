import 'package:flutter/material.dart';
import '../widgets/boton_accion.dart';
import '../widgets/etiqueta_chip.dart';
import '../widgets/parrafo_texto.dart';
import '../widgets/titulo_seccion.dart';

/// Pantalla 5: informacion del blog y del proyecto.
class AcercaScreen extends StatelessWidget {
  const AcercaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acerca del blog',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        children: [
          const TituloSeccion(texto: 'Libro Blog'),
          const ParrafoTexto(
            texto: 'Un blog de lectura donde comparto reseñas de novelas '
                'que me gustaron: terror, fantasía, clásicos y más.',
          ),
          const TituloSeccion(texto: 'Cómo está hecha'),
          const ParrafoTexto(
            texto: 'Las reseñas se leen desde un archivo JSON local y se '
                'convierten en objetos Dart. Las imágenes vienen de internet.',
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              EtiquetaChip(texto: 'Flutter'),
              EtiquetaChip(texto: 'JSON local'),
              EtiquetaChip(texto: 'Navigator'),
              EtiquetaChip(texto: 'Widgets reutilizables'),
            ],
          ),
          const SizedBox(height: 32),
          BotonAccion(
            texto: 'Volver',
            icono: Icons.arrow_back_rounded,
            relleno: false,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
