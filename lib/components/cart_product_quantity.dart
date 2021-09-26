import 'package:first_application/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProductQuantity extends StatefulWidget {
  final ProductModel item;

  const CartProductQuantity({Key? key, required this.item}) : super(key: key);

  @override
  _CartProductQuantityState createState() => _CartProductQuantityState();
}

class _CartProductQuantityState extends State<CartProductQuantity> {
  @override
  Widget build(BuildContext context) {
    CartModel provider = Provider.of<CartModel>(context);

    return SizedBox(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.grey[200],
              padding: const EdgeInsets.all(0),
              minimumSize: const Size(30, 20),
            ),
            onPressed: () {
              provider.decrease(widget.item.id);
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            width: 20,
            child: Text(
              widget.item.quantity.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.grey[200],
              padding: const EdgeInsets.all(0),
              minimumSize: const Size(30, 20),
            ),
            onPressed: () {
              provider.increase(widget.item.id);
            },
            child: const Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
