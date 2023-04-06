import 'package:picsel_github/modules/user/data/models/repository_model.dart';
import 'package:picsel_github/modules/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.login,
      required super.avatar_url,
      super.name,
      required super.bio,
      required super.repos});

  factory UserModel.fromJson(
    Map<String, dynamic> json,
    List reposjson,
  ) {
    return UserModel(
        login: json['login'],
        avatar_url: json['avatar_url'],
        name: json['name'],
        bio: json['bio'],
        repos: (reposjson).map((e) => RepositoryModel.fromJson(e)).toList());
  }
}
