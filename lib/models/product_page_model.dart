import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductPageModel extends ChangeNotifier {
  final double price;
  int _quantity = 1;
  String _totalAsCurrency = '';

  ProductPageModel({required this.price});

  initState() {
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
    _quantity++;
    _setTotalAsCurrency(total);
  }

  void decrease() {
    if (_quantity > 1) {
      _quantity--;
      _setTotalAsCurrency(total);
    }
  }
}
