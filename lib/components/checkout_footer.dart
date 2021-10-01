import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_application/models/models.dart';

class CheckoutFooter extends StatelessWidget {
  const CheckoutFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartModel cartProvider = Provider.of<CartModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'result for ${cartProvider.items.length} order',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                cartProvider.totalAsCurrency,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                final order = cartProvider.checkout();
                Navigator.of(context).pushNamed(
                  'order_detail',
                  arguments: order,
                );
              },
              child: const Text(
                'Buy Now',
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
          )
        ],
      ),
    );
  }
}
