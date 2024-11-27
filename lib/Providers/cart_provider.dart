import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  void addProduct(Map<String, dynamic> product) {
    final existingProductIndex = _cart.indexWhere((element) =>
        element['id'] == product['id'] && element['sizes'] == product['sizes']);

    if (existingProductIndex >= 0) {
      _cart[existingProductIndex]['quantity'] += 1;
    } else {
      product['quantity'] = 1;
      _cart.add(product);
    }
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    final existingProductIndex = _cart.indexWhere((element) =>
        element['id'] == product['id'] && element['sizes'] == product['sizes']);

    if (existingProductIndex >= 0) {
      if (_cart[existingProductIndex]['quantity'] > 1) {
        _cart[existingProductIndex]['quantity'] -= 1;
      } else {
        _cart.removeAt(existingProductIndex);
      }
    }
    notifyListeners();
  }

  int get itemCount {
    return _cart.fold(0, (sum, item) => sum + item['quantity'] as int);
  }
}
