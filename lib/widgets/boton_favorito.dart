import 'package:flutter/material.dart';
import '../services/favoritos_service.dart';
import '../tema.dart';

/// Corazon para marcar o quitar un favorito. Escucha el FavoritosService,
/// asi se actualiza solo en cualquier pantalla donde aparezca.
class BotonFavorito extends StatelessWidget {
  final int libroId;
  final Color colorInactivo;

  const BotonFavorito({
    super.key,
    required this.libroId,
    this.colorInactivo = Colores.textoSuave,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<int>>(
      valueListenable: FavoritosService.ids,
      builder: (context, ids, _) {
        final esFavorito = ids.contains(libroId);
        return IconButton(
          tooltip: esFavorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
          onPressed: () => FavoritosService.alternar(libroId),
          icon: Icon(
            esFavorito ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: esFavorito ? Colores.acento : colorInactivo,
          ),
        );
      },
    );
  }
}
