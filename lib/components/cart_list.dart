import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AnimatedList(
              initialItemCount: cart.items.length,
              itemBuilder: (context, index, animation) {
                return CartProduct(
                  item: cart.items[index],
                  animation: animation,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
