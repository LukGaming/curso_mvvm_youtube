import 'package:curso_mvvm_youtube/data/repositories/product/product_repository.dart';
import 'package:curso_mvvm_youtube/data/services/api/api_client.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';

class ProductRepositoryRemote implements ProductRepository {
  final ApiClient _apiClient;

  const ProductRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<Result<List<Product>>> getProducts() async {
    return await _apiClient.getProducts();
  }
}
