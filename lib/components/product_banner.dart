import 'package:flutter/material.dart';

class ProductBanner extends StatelessWidget {
  final String image;

  const ProductBanner({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(image),
    );
  }
}
