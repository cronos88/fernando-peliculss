import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';
import '../providers/peliculas_provider.dart';
import '../widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = PeliculasProvider();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en Cines'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>>? snapshot) {
        final screenSize = MediaQuery.of(context).size;
        if (snapshot!.hasData) {
          return CardSwiper(
            peliculas: snapshot.data!,
          );
        } else {
          return SizedBox(
            height: screenSize.height * 0.45,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

// SIGUE EL VIDEO 102 

