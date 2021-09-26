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

  void add(ProductModel item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(int id) {
    // TODO
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
