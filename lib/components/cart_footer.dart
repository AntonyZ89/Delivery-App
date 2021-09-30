import 'package:first_application/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({Key? key}) : super(key: key);

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
              onPressed: cartProvider.items.isNotEmpty
                  ? () {
                      Navigator.of(context).pushNamed('checkout');
                    }
                  : null,
              child: const Text(
                'Checkout Order',
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
