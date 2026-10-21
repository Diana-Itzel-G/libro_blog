import 'package:flutter/material.dart';
import '../tema.dart';

/// Dato corto con icono arriba, valor en negritas y etiqueta debajo.
class DatoLibro extends StatelessWidget {
  final IconData icono;
  final String valor;
  final String etiqueta;

  const DatoLibro({
    super.key,
    required this.icono,
    required this.valor,
    required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, color: Colores.primario, size: 22),
        const SizedBox(height: 6),
        Text(valor, style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 2),
        Text(
          etiqueta,
          style: const TextStyle(fontSize: 12, color: Colores.textoSuave),
        ),
      ],
    );
  }
}
