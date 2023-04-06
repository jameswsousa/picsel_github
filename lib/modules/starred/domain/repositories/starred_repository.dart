import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:picsel_github/modules/user/data/models/repository_model.dart';

abstract class StarredRepository {
  Future<Either<Failure, List<RepositoryModel>>> getStarredFromUser(
      String username);
}
