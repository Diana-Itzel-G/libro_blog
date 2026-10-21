import 'package:flutter/material.dart';
import '../tema.dart';

/// Parrafo con interlineado comodo para leer.
class ParrafoTexto extends StatelessWidget {
  final String texto;

  const ParrafoTexto({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 16, height: 1.7, color: Colores.texto),
    );
  }
}
