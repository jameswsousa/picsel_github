import 'dart:convert';
import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:picsel_github/modules/user/data/models/repository_model.dart';

abstract class StarredDataSource {
  Future<List<RepositoryModel>> getStarredFromUser(String text);
}

class StarredDataSourceImpl extends StarredDataSource {
  final http.Client client;

  StarredDataSourceImpl(this.client);

  @override
  Future<List<RepositoryModel>> getStarredFromUser(String username) =>
      _getStarredFromUser('https://api.github.com/users/$username/starred');

  Future<List<RepositoryModel>> _getStarredFromUser(String url) async {
    final response = await client.get(
        Uri.parse(
          url,
        ),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => RepositoryModel.fromJson((e)))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
