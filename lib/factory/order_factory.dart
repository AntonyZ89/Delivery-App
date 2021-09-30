import 'dart:math';

import 'package:faker/faker.dart';
import 'package:first_application/factory/factory.dart';
import 'package:first_application/models/models.dart';

class OrderFactory extends ModelFactory<OrderModel> {
  @override
  generateFake() {
    return OrderModel(
      createdAt: faker.date.dateTime().toString(),
      products:
          ProductFactory().generateFakeList(length: Random().nextInt(15) + 1),
    );
  }

  @override
  List<OrderModel> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
