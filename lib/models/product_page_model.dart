import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductPageModel extends ChangeNotifier {
  final double price;
  int _quantity = 1;
  String _totalAsCurrency = '';

  static const int min = 1, max = 10;

  ProductPageModel({required this.price}) {
    _setTotalAsCurrency(total);
  }

  int get quantity => _quantity;

  double get total => price * _quantity;

  String get totalAsCurrency => _totalAsCurrency;

  void _setTotalAsCurrency(double total) {
    _totalAsCurrency =
        NumberFormat.simpleCurrency(locale: 'pt-BR').format(total);
    notifyListeners();
  }

  void increase() {
    if (_quantity < max) {
      _quantity++;
      _setTotalAsCurrency(total);
    }
  }

  void decrease() {
    if (_quantity > min) {
      _quantity--;
      _setTotalAsCurrency(total);
    }
  }
}
