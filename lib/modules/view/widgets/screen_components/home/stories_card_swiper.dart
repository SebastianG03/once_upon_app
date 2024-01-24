import 'package:flutter/material.dart';
import 'package:once_upon_app/modules/entity/application/application_models.dart' show Tale;
import 'package:card_swiper/card_swiper.dart';

class StoriesCardSwiper extends StatelessWidget {
  final List<Tale> tales;
  const StoriesCardSwiper({super.key, required this.tales});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: tales.length,
        itemBuilder: (context, index) => Slide(tale: tales[index]),
      ),
    );
  }
}


class Slide extends StatelessWidget {
  final Tale tale;
  const Slide({super.key, required this.tale});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
