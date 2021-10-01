import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:first_application/components/components.dart';
import 'package:first_application/models/models.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as ProductModel;

    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      appBar: AppBarDefault(
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
          create: (context) => ProductPageModel(price: item.price),
          builder: (context, model) => Flex(
            direction: Axis.vertical,
            children: [
              ProductPageDetail(item: item),
              ProductPageFooter(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
