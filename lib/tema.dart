import 'package:flutter/material.dart';

/// Paleta de colores suaves.
class Colores {
  static const Color fondo = Color(0xFFFAF6F0);
  static const Color primario = Color(0xFF7A6A8F);
  static const Color primarioSuave = Color(0xFFE9E3F0);
  static const Color acento = Color(0xFFC98B8B);
  static const Color texto = Color(0xFF3A3340);
  static const Color textoSuave = Color(0xFF8A8290);
  static const Color borde = Color(0xFFEDE6DC);
  static const Color estrella = Color(0xFFE0A85C);
}

ThemeData crearTema() {
  final esquema = ColorScheme.fromSeed(
    seedColor: Colores.primario,
  ).copyWith(primary: Colores.primario, surface: Colores.fondo);

  return ThemeData(
    useMaterial3: true,
    colorScheme: esquema,
    scaffoldBackgroundColor: Colores.fondo,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colores.fondo,
      foregroundColor: Colores.texto,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
  );
}
