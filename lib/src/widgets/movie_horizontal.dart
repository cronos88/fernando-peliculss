import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  const MovieHorizontal({Key? key, required this.peliculas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.3,
      child: PageView(
        pageSnapping: false, //movimiento más fluido
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _tarjetas(),
      ),
    );
  }

  List<Widget> _tarjetas() {
    return peliculas.map((pelicula) {
      return Container(
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
    }).toList();
  }
}
