import 'dart:collection';

import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<ProductModel> _items = [];

  UnmodifiableListView<ProductModel> get items => UnmodifiableListView(_items);

  double get total => _items.fold(
        0,
        (previousValue, element) => previousValue + element.price,
      );

  void increase(String id) {
    ProductModel? item = _items.firstWhere((item) => item.id == id);

    if (item.quantity < 10) {
      item.quantity++;
      notifyListeners();
    }
  }

  void decrease(String id) {
    ProductModel? item = _items.firstWhere((item) => item.id == id);

    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
    }
  }

  void add(ProductModel item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(String id) {
    print(id);

    _items.removeAt(
      _items.indexWhere((item) => item.id == id),
    );
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
