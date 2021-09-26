import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductPageArguments;

    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBar(
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
              primary: Colors.grey.withOpacity(0.5),
              elevation: 0,
              padding: const EdgeInsets.all(5),
              minimumSize: const Size(0, 0),
              alignment: Alignment.center,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          SizedBox(
            height: 40,
            child: FilterButton(
              onTap: () {},
              selected: true,
              category: 'FAST FOOD',
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.only(
          top: viewPadding.top,
          bottom: viewPadding.bottom,
        ),
        child: ChangeNotifierProvider<ProductPageModel>(
          create: (context) => ProductPageModel(price: args.price),
          builder: (context, model) => Flex(
            direction: Axis.vertical,
            children: [
              ProductPageDetail(args: args),
              ProductPageFooter(item: args.item),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPageArguments {
  final ProductModel item;

  String name = '', image = '', description = '';
  double price = 0;

  String _priceAsCurrency = '';

  ProductPageArguments(this.item) {
    name = item.name;
    image = item.image;
    description = item.description;
    price = item.price;

    _priceAsCurrency =
        NumberFormat.simpleCurrency(locale: 'pt-BR').format(price);
  }

  String get priceAsCurrency => _priceAsCurrency;
}
