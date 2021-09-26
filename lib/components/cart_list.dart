import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      builder: (context, child) {
        return Consumer<CartModel>(
          builder: (context, cart, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: cart.items
                    .map(
                      (item) => CartProduct(item: item),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}
