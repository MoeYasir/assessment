import 'package:movies_2/model/user_model.dart';
import 'package:movies_2/resource/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<UserModel>> fetchUserList() {
    return _apiProvider.fetchUsers();
  }
}

class NetworkError extends Error {}
