import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';

class OrderListCard extends StatelessWidget {
  final OrderModel item;

  static const int maxProducts = 3;

  const OrderListCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = item.products.sublist(
      0,
      item.products.length > maxProducts ? maxProducts : item.products.length,
    );

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          'order_detail',
          arguments: item,
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 2), //(x,y)
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        'Em andamento - N ${'item.id'}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ...products.map((product) => _ProductList(item: product)),
                    Visibility(
                      visible: item.products.length > maxProducts,
                      child: Text(
                        '+ ${item.products.length - maxProducts} products',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Text(
                  item.totalAsCurrency,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            _Rate(item.rate),
          ],
        ),
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final ProductModel item;

  const _ProductList({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5, bottom: 5),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(item.quantity.toString()),
        ),
        Text(
          item.name,
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class _Rate extends StatelessWidget {
  final int rate;

  const _Rate(this.rate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(rate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Rate'),
        Row(
          children: List<Icon>.generate(
            5,
            (i) => Icon(
              Icons.star,
              size: 16,
              color: rate > i ? Colors.yellow : Colors.grey[350],
            ),
          ),
        )
      ],
    );
  }
}
