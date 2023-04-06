import 'dart:convert';
import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:picsel_github/modules/search/data/models/user_result_model.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';

abstract class SearchDataSource {
  Future<List<UserResultEntity>> searchUsers(String text);
}

class SearchDataSourceImpl extends SearchDataSource {
  final http.Client client;

  SearchDataSourceImpl(this.client);

  @override
  Future<List<UserResultEntity>> searchUsers(String text) =>
      _searchUsers('https://api.github.com/search/users?q=$text');

  Future<List<UserResultEntity>> _searchUsers(String url) async {
    final response = await client.get(
        Uri.parse(
          url,
        ),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return ((json.decode(response.body) as Map)['items'] as List)
          .map((e) => UserResultModel.fromJson((e)))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
