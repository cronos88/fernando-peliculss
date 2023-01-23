import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final pelicula = ModalRoute.of(context)!.settings.arguments as Pelicula;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(pelicula),
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.deepOrangeAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          pelicula.title!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackdropImg()),
          placeholder: const AssetImage('assets/loading.gif'),
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
