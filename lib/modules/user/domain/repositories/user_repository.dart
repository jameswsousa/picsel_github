import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/errors/failures.dart';

import 'package:picsel_github/modules/user/domain/entities/user_entity.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser(String username);
  Future<Either<Failure, List<UserResultEntity>>> searchUser(String text);
}
