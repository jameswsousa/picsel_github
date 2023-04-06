import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/errors/failures.dart';

import '../entities/user_result_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<UserResultEntity>>> searchUsers(String text);
}
