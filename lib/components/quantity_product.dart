import 'package:first_application/models/models.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityProduct extends StatefulWidget {
  const QuantityProduct({Key? key}) : super(key: key);

  @override
  _QuantityProductState createState() => _QuantityProductState();
}

class _QuantityProductState extends State<QuantityProduct> {
  @override
  Widget build(BuildContext context) {
    ProductPageModel provider = Provider.of<ProductPageModel>(context);

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
              provider.decrease();
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            width: 20,
            child: Text(
              provider.quantity.toString(),
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
              provider.increase();
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
