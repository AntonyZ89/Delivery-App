import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatelessWidget {
  final List<String> banners = [
    'assets/images/banners/banner1.jpg',
    'assets/images/banners/banner2.jpg',
    'assets/images/banners/banner3.jpg',
    'assets/images/banners/banner4.jpg',
  ];

  HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 150.0),
      items: banners.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(child: Image.asset(i));
          },
        );
      }).toList(),
    );
  }
}
