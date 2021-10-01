import 'package:intl/intl.dart';

class ProductModel {
  final String id, name, image, description;
  final double price;
  int quantity = 1;

  String _priceAsCurrency = '';

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  }) {
    _priceAsCurrency = NumberFormat.simpleCurrency(locale: 'en').format(price);
  }

  String get priceAsCurrency => _priceAsCurrency;
}
