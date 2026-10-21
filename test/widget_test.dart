import 'package:flutter_test/flutter_test.dart';
import 'package:libro_blog/models/libro.dart';

void main() {
  test('Libro.fromJson mapea los campos del JSON', () {
    final libro = Libro.fromJson({
      'id': 1,
      'titulo': 'Libro de prueba',
      'autor': 'Autor',
      'genero': 'Fantasía',
      'portada': 'https://picsum.photos/id/24/600/800',
      'calificacion': 5, // entero a proposito: debe convertirse a double
      'paginas': 300,
      'sinopsis': 'Sinopsis',
      'resenia': 'Reseña',
      'etiquetas': ['a', 'b'],
    });

    expect(libro.titulo, 'Libro de prueba');
    expect(libro.calificacion, 5.0);
    expect(libro.etiquetas.length, 2);
  });
}
