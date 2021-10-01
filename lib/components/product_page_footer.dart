import 'package:first_application/models/models.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPageFooter extends StatelessWidget {
  final ProductModel item;

  const ProductPageFooter({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductPageModel productPageProvider =
        Provider.of<ProductPageModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Text(
            productPageProvider.totalAsCurrency,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(
                    item,
                    productPageProvider.quantity,
                  );
                  Navigator.of(context).pushNamed('cart');
                },
                child: const Text(
                  'Add to Card',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  primary: Colors.yellow[600],
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
