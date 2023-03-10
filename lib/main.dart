import 'package:flutter/material.dart';
import 'src/pages/pelicula_detalle.dart';

import 'src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'detalle': (context) => const PeliculaDetalle(),
      },
    );
  }
}
