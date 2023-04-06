import 'dart:convert';

import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:picsel_github/modules/search/data/models/user_result_model.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserDataSource {
  Future<UserModel> getUser(String username);
  Future<List<UserResultModel>> searchUser(String text);
}

class UserDataSourceImpl extends UserDataSource {
  final http.Client client;

  UserDataSourceImpl(this.client);

  @override
  Future<UserModel> getUser(String username) => _getUserFromUrl(
      'https://api.github.com/users/$username',
      'https://api.github.com/users/$username/repos');

  @override
  Future<List<UserResultModel>> searchUser(String text) =>
      _getUserResultsFromUrl('https://api.github.com/search/users?q={$text}');

  Future<UserModel> _getUserFromUrl(String url, String reposUrl) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    final reposResponse = await client.get(Uri.parse(reposUrl),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200 && reposResponse.statusCode == 200) {
      return UserModel.fromJson(
          json.decode(response.body), json.decode(reposResponse.body));
    } else {
      throw ServerException();
    }
  }

  Future<List<UserResultModel>> _getUserResultsFromUrl(String url) async {
    final response = await client.get(
        Uri.parse(
          url,
        ),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return (response.body as List)
          .map((e) => UserResultModel.fromJson(json.decode(e)))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
