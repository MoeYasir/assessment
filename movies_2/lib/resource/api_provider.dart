import 'package:dio/dio.dart';
import 'package:movies_2/model/user_model.dart';

class ApiProvider {
  Dio dio = Dio();
  final String _uri = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModel>> fetchUsers() async {
    try {
      Response response = await dio.get(_uri);
      List<dynamic> value = response.data;
      return value.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [UserModel.withError("Check you internet connection please")];
      } else {
        return [UserModel.withError(e.toString())];
      }
    }
  }
}
