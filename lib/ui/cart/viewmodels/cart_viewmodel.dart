import 'package:curso_mvvm_youtube/domain/models/cart_item.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:flutter/material.dart';

class CartViewmodel extends ChangeNotifier {
  List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addProductToCart(Product product) {
    for (int i = 0; i < _items.length; i++) {
      if (isProductInCart(product)) {
        _items[i].productCount++;
        notifyListeners();
        return;
      }
    }

    _items.add(CartItem(product: product, productCount: 1));
    notifyListeners();
  }

  bool isProductInCart(Product product) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].product.id == product.id) {
        return true;
      }
    }
    return false;
  }
}
