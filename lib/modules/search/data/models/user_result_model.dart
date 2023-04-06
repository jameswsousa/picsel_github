import '../../domain/entities/user_result_entity.dart';

class UserResultModel extends UserResultEntity {
  UserResultModel({
    required super.login,
  });

  factory UserResultModel.fromJson(Map<String, dynamic> json) {
    return UserResultModel(login: json['login']);
  }
}
