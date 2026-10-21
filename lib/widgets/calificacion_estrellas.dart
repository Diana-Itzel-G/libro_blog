import 'package:flutter/material.dart';
import '../tema.dart';

/// Muestra una calificacion de 0 a 5 con estrellas.
class CalificacionEstrellas extends StatelessWidget {
  final double valor;
  final double tamano;

  const CalificacionEstrellas({super.key, required this.valor, this.tamano = 18});

  IconData _icono(int posicion) {
    if (valor >= posicion + 1) return Icons.star_rounded;
    if (valor >= posicion + 0.5) return Icons.star_half_rounded;
    return Icons.star_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          Icon(_icono(i), size: tamano, color: Colores.estrella),
        const SizedBox(width: 6),
        Text(
          valor.toStringAsFixed(1),
          style: TextStyle(
            fontSize: tamano * 0.8,
            fontWeight: FontWeight.w600,
            color: Colores.textoSuave,
          ),
        ),
      ],
    );
  }
}
