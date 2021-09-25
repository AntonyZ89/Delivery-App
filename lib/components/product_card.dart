import 'package:first_application/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:first_application/components/components.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          'product',
          arguments: const ProductArguments(
            name: 'Cheese Burguer',
            image: 'assets/images/hamburger.jpg',
            price: 'R\$ 2.00',
            description:
                'Elit ad exercitation dolor enim dolor est minim in velit veniam duis incididunt eu eiusmod.',
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0.0, 5.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 155,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/hamburger.jpg',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Cheese Burguer',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Fast Food',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('R\$ 2,00'),
                    FavoriteButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
