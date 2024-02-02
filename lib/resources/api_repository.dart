import 'package:assessment/model/product_model.dart';
import 'package:assessment/resources/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<ProductModel>> fetchProductList() {
    return _apiProvider.fetchProducts();
  }
}

class NetworkError extends Error {}
