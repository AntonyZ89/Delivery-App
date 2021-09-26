import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  final ProductModel item;

  const CartProduct({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/hamburger.jpg',
              width: 100,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: const [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Title',
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Subtitle',
                    textAlign: TextAlign.start,
                  ),
                ),
              ]),
            ),
          ),
          CartProductQuantity(item: item)
        ],
      ),
    );
  }
}
