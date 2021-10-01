import 'dart:collection';

import 'package:first_application/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartModel extends ChangeNotifier {
  final List<ProductModel> _items = [];
  final List<OrderModel> _orders = [];

  UnmodifiableListView<ProductModel> get items =>
      UnmodifiableListView<ProductModel>(_items.sublist(0));
  UnmodifiableListView<OrderModel> get orders =>
      UnmodifiableListView<OrderModel>(_orders.sublist(0));

  double get total {
    return _items.fold<double>(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
  }

  String get totalAsCurrency =>
      NumberFormat.simpleCurrency(locale: 'en').format(total);

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

  void add(ProductModel item, int quantity) {
    int index = _items.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      items[index].quantity += quantity;
    } else {
      item.quantity = quantity;
      _items.add(item);
    }

    notifyListeners();
  }

  void remove(String id) {
    _items.removeAt(
      _items.indexWhere((item) => item.id == id),
    );
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void checkout() {
    OrderModel order = OrderModel(
      createdAt: DateTime.now().toLocal().toString(),
      products: items,
    );

    _orders.add(order);

    clear();
  }
}
