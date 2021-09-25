import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityProduct extends StatefulWidget {
  const QuantityProduct({Key? key}) : super(key: key);

  @override
  _QuantityProductState createState() => _QuantityProductState();
}

class _QuantityProductState extends State<QuantityProduct> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.grey[200],
            ),
            onPressed: () {
              if (_count > 1) {
                setState(() {
                  _count--;
                });
              }
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              _count.toString(),
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
            ),
            onPressed: () {
              setState(() {
                _count++;
              });
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
