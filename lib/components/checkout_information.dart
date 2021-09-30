import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CheckoutInformation extends StatelessWidget {
  const CheckoutInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartModel provider = Provider.of<CartModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 16),
          child: const Text(
            'Order Information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: [
            ...provider.items
                .map(
                  (item) => _Information(
                    title: '${item.quantity}x',
                    subtitle: item.name,
                  ),
                )
                .toList(growable: false),
            const _Information(
              title: '25 minutes',
              subtitle: 'Estimated time',
            )
          ],
        ),
      ],
    );
  }
}

class _Information extends StatelessWidget {
  final String title, subtitle;

  const _Information({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
