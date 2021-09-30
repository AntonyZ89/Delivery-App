import 'package:flutter/material.dart';

class CheckoutMethod extends StatefulWidget {
  const CheckoutMethod({Key? key}) : super(key: key);

  @override
  State<CheckoutMethod> createState() => _CheckoutMethodState();
}

class _CheckoutMethodState extends State<CheckoutMethod> {
  String? _chosenValue = 'Digital Wallet';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: double.infinity),
        const Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          focusColor: Colors.white,
          value: _chosenValue,
          style: const TextStyle(color: Colors.white),
          iconEnabledColor: Colors.black,
          items: [
            'Digital Wallet',
            'Credit Card',
            'Debit Card',
          ].map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black87),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _chosenValue = value;
            });
          },
        ),
      ],
    );
  }
}
