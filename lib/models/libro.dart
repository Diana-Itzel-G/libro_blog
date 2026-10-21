/// Modelo: una resena de libro del blog.
class Libro {
  final int id;
  final String titulo;
  final String autor;
  final String genero;
  final String portada;
  final double calificacion;
  final int paginas;
  final String sinopsis;
  final String resenia;
  final List<String> etiquetas;

  Libro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.genero,
    required this.portada,
    required this.calificacion,
    required this.paginas,
    required this.sinopsis,
    required this.resenia,
    required this.etiquetas,
  });

  // Constructor factory: transforma el diccionario JSON en un objeto Dart
  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      autor: json['autor'] as String,
      genero: json['genero'] as String,
      portada: json['portada'] as String,
      calificacion: (json['calificacion'] as num).toDouble(),
      paginas: json['paginas'] as int,
      sinopsis: json['sinopsis'] as String,
      resenia: json['resenia'] as String,
      // Casteo seguro de lista dinamica a lista de Strings
      etiquetas: List<String>.from(json['etiquetas'] as List),
    );
  }
}
