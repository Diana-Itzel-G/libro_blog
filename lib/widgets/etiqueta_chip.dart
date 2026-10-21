import 'package:flutter/material.dart';
import '../tema.dart';

/// Etiqueta pequena y redondeada (genero, tema, etc.).
class EtiquetaChip extends StatelessWidget {
  final String texto;
  final Color? fondo;

  const EtiquetaChip({super.key, required this.texto, this.fondo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: fondo ?? Colores.primarioSuave,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colores.texto,
        ),
      ),
    );
  }
}
