// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curso_mvvm_youtube/domain/models/product.dart';

class CartItem {
  Product product;
  int productCount;
  CartItem({required this.product, required this.productCount});
}
