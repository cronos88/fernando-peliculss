import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    // ignore: sized_box_for_whitespace
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 300,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 250,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://loremflickr.com/320/240",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
      ),
    );
  }
}

// SIGUE EL VIDEO 98