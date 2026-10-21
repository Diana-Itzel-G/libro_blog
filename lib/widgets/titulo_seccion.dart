import 'package:flutter/material.dart';
import '../tema.dart';

/// Encabezado de seccion con una pequena linea decorativa.
class TituloSeccion extends StatelessWidget {
  final String texto;
  final EdgeInsetsGeometry margen;

  const TituloSeccion({
    super.key,
    required this.texto,
    this.margen = const EdgeInsets.fromLTRB(0, 24, 0, 10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colores.texto,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: 36,
            height: 3,
            decoration: BoxDecoration(
              color: Colores.acento,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
