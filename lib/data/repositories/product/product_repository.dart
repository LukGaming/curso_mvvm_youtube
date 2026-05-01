import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();
}
