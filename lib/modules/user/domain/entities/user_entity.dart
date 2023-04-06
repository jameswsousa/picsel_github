import 'package:picsel_github/modules/user/domain/entities/repository_entity.dart';

class UserEntity {
  final String login;
  final String? name;
  final String avatar_url;
  final String? bio;
  final List<RepositoryEntity> repos;

  UserEntity(
      {required this.login,
      required this.avatar_url,
      this.name,
      this.bio,
      required this.repos});
}
