import 'package:flutter/material.dart';
import 'package:first_application/components/components.dart';
import 'package:first_application/screens/product_page.dart';

class ProductPageDetail extends StatelessWidget {
  final ProductArguments args;

  const ProductPageDetail({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(args.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        args.name,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const FavoriteButton(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        args.price,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline4?.merge(
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      ),
                      const QuantityProduct()
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  width: double.infinity,
                  child: const Text(
                    'Description',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(args.description)
              ],
            ),
          )
        ],
      ),
    );
  }
}
