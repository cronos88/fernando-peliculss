import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final pelicula = ModalRoute.of(context)!.settings.arguments as Pelicula;
    return Scaffold(
      body: Center(
        child: Text(pelicula.title!),
      ),
    );
  }
}
