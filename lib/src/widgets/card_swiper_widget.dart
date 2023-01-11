// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> peliculas;

  const CardSwiper({
    Key? key,
    required this.peliculas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: screenSize.width * 0.7,
        itemHeight: screenSize.height * 0.45,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://loremflickr.com/320/240",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
