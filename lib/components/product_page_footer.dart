import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPageFooter extends StatelessWidget {
  const ProductPageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          const Text(
            'R\$ 2.00',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add to Card',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
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
