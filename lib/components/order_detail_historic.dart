import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class OrderDetailHistoric extends StatelessWidget {
  final List<OrderDetailHistoricItem> children;

  const OrderDetailHistoric({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map<List<Widget>>((item) => [
                item,
                if (i++ < children.length - 1) const _Divider(),
              ])
          .expand((element) => element)
          .toList(),
    );
  }
}

class OrderDetailHistoricItem extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;

  const OrderDetailHistoricItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            icon,
            size: 25,
            color: Colors.yellow[600],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: const EdgeInsets.only(left: 31),
      width: 2,
      color: Colors.grey[300],
    );
  }
}
