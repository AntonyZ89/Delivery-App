import 'package:faker/faker.dart';
import 'package:first_application/models/models.dart';
import 'dart:math';

import 'model_factory.dart';

class ProductFactory extends ModelFactory<ProductModel> {
  @override
  generateFake() {
    return ProductModel(
      id: createFakeUuid(),
      name: faker.food.restaurant(),
      image: faker.image.image(random: true),
      // image: 'assets/images/hamburger.jpg',
      description: faker.lorem.sentence(),
      price: Random().nextDouble(),
    );
  }

  @override
  List<ProductModel> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
