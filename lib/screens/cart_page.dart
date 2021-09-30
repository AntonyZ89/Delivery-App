import 'package:first_application/components/components.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDefault(
        title: Text('My Order'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: const [
              CartLocationCard(),
              CartList(),
              CartFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
