import 'package:first_application/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductArguments;

    final statusBarPadding = MediaQuery.of(context).viewPadding.top;

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
      // extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.only(top: statusBarPadding),
        child: Flex(
          direction: Axis.vertical,
          children: [
            ProductPageDetail(args: args),
            const ProductPageFooter(),
          ],
        ),
      ),
    );
  }
}

class ProductArguments {
  final String name;
  final String image;
  final String price;
  final String description;

  const ProductArguments({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    this.description = '',
  });
}
