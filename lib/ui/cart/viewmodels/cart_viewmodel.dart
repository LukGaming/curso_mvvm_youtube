import 'package:curso_mvvm_youtube/data/repositories/cart/cart_repository.dart';
import 'package:curso_mvvm_youtube/domain/models/cart_item.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:flutter/material.dart';

class CartViewmodel extends ChangeNotifier {
  final CartRepository _cartRepository;

  List<CartItem> _items = [];

  CartViewmodel({required CartRepository cartRepository})
    : _cartRepository = cartRepository {
    _cartRepository.addListener(() {
      _items = _cartRepository.items;
      notifyListeners();
    });
  }

  List<CartItem> get items => _items;

  void addProductToCart(Product product) {
    return _cartRepository.addProductToCart(product);
  }

  bool isProductInCart(Product product) {
    return _cartRepository.isProductInCart(product);
  }
}
