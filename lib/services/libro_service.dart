import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/libro.dart';

/// Capa de datos: lee el archivo JSON local y devuelve objetos Libro.
class LibroService {
  static Future<List<Libro>> cargarLibros() async {
    final String texto = await rootBundle.loadString('assets/libros.json');
    final List<dynamic> datos = jsonDecode(texto) as List<dynamic>;
    return datos
        .map((json) => Libro.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
