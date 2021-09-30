import 'dart:math';

import 'package:first_application/models/models.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String id = const Uuid().v4(), createdAt;
  final List<ProductModel> products;
  final int rate;

  num? _total;
  String? _totalAsCurrency;

  OrderModel({
    required this.createdAt,
    required this.products,
    this.rate = 0,
  });

  num get total {
    return _total ??= products.fold<num>(
      0,
      (total, product) => total + product.price,
    );
  }

  String get totalAsCurrency {
    return _totalAsCurrency ??= NumberFormat.simpleCurrency(
      locale: 'pt-BR',
    ).format(total);
  }
}
