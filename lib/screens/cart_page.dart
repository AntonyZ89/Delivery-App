import 'package:first_application/components/components.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.black.withOpacity(0.7),
              elevation: 0,
              padding: const EdgeInsets.all(5),
              minimumSize: const Size(0, 0),
              alignment: Alignment.center,
            ),
          ),
        ),
        foregroundColor: Colors.black87,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
