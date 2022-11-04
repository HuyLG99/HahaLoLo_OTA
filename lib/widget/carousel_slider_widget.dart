import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      height: 220,
      indicatorRadius: 4,
      indicatorColor: Colors.white,
      onPageChanged: (value) {
        // debugPrint('Page changed: $value');
      },
      autoPlayInterval: 10000,
      isLoop: true,
      children: [
        Image.network(
          'https://www.kindpng.com/picc/m/254-2549839_transparent-404-png-404-not-found-medicine-png.png',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://www.kindpng.com/picc/m/254-2549839_transparent-404-png-404-not-found-medicine-png.png',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
