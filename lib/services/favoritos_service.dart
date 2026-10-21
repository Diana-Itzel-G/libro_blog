import 'package:flutter/foundation.dart';

/// Guarda los ids de los libros favoritos mientras la app esta abierta.
/// Usa ValueNotifier: los widgets que lo escuchan se actualizan solos.
class FavoritosService {
  static final ValueNotifier<Set<int>> ids = ValueNotifier<Set<int>>({});

  static bool esFavorito(int id) => ids.value.contains(id);

  static void alternar(int id) {
    // Se crea un Set nuevo para que el ValueNotifier detecte el cambio
    final nuevo = Set<int>.from(ids.value);
    if (!nuevo.remove(id)) nuevo.add(id);
    ids.value = nuevo;
  }
}
