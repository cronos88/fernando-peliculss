// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({
    Key? key,
    required this.peliculas,
    required this.siguientePagina,
  }) : super(key: key);

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return SizedBox(
      height: screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false, //movimiento más fluido
        controller: _pageController,
        // children: _tarjetas(),
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return _tarjeta(context, peliculas[index]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final tarjeta = Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: const AssetImage('assets/no-image.jpg'),
              fit: BoxFit.fill,
              height: 160,
            ),
          ),
          Text(pelicula.title!, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.of(context).pushNamed('detalle', arguments: pelicula);
      },
    );
  }
}
