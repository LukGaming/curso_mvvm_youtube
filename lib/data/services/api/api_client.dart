import 'package:curso_mvvm_youtube/data/services/api/models/login_request.dart';
import 'package:curso_mvvm_youtube/data/services/api/models/login_response.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final String _apiUrl;
  final Dio _dio;

  const ApiClient({required String apiUrl, required Dio dio})
    : _dio = dio,
      _apiUrl = apiUrl;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final endpoint = "$_apiUrl/auth/login";

      final response = await _dio.post(endpoint, data: loginRequest.toJson());

      if (response.statusCode == 200) {
        final result = LoginResponse.fromJson(response.data);
        return Result.ok(result);
      }
      return Result.error(Exception("Ocorreu um erro ao efetuar login"));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<List<Product>>> getProducts() async {
    try {
      final endpoint = "$_apiUrl/products";
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        final productsJson = (response.data["products"] as List);
        final products = productsJson
            .map((product) => Product.fromJson(product))
            .toList();
        return Result.ok(products);
      }
      return Result.error(Exception("Ocorreu um erro ao buscar produtos"));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
