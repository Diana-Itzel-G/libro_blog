import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'tema.dart';

void main() {
  runApp(const LibroBlogApp());
}

class LibroBlogApp extends StatelessWidget {
  const LibroBlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libro Blog',
      debugShowCheckedModeBanner: false,
      theme: crearTema(),
      home: const SplashScreen(),
    );
  }
}
