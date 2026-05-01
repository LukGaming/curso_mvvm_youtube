import 'package:curso_mvvm_youtube/data/repositories/product/product_repository.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/utils/command.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:flutter/foundation.dart';

class ProductViewmodel extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductViewmodel({required ProductRepository productRepository})
    : _productRepository = productRepository;

  List<Product> _products = [];

  List<Product> get products => _products;

  late final load = Command0(_load);

  Future<Result<List<Product>>> _load() async {
    try {
      final result = await _productRepository.getProducts();
      switch (result) {
        case Ok<List<Product>>():
          _products = result.value;
          return result;
        default:
          return result;
      }
    } finally {
      notifyListeners();
    }
  }
}
