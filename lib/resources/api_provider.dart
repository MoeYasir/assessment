import 'package:assessment/model/product_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();
  final String _uri = "https://65bc39fd52189914b5bdb087.mockapi.io/products";

  Future<List<ProductModel>> fetchProducts() async {
    try {
      Response response = await dio.get(_uri);
      List<dynamic> value = response.data;
      return value.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [ProductModel.withError("Check you internet connection please")];
      } else {
        return [ProductModel.withError(e.toString())];
      }
    }
  }
}
