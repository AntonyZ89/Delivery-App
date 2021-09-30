import 'package:first_application/components/components.dart';
import 'package:first_application/components/order_list_card.dart';
import 'package:first_application/factory/factory.dart';
import 'package:first_application/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartModel cartProvider = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBarDefault(
        title: const Text('My Orders'),
        onBack: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            'home',
            (route) => false,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListView(
          children: cartProvider.orders
              .map(
                (order) => OrderListCard(item: order),
              )
              .toList(),
        ),
      ),
    );
  }
}
