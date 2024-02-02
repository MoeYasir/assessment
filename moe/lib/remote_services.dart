import 'package:http/http.dart' as http;
import 'package:moe/postModel.dart';

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    final client = http.Client();
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
