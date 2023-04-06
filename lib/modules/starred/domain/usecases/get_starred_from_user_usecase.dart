import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:picsel_github/modules/starred/domain/repositories/starred_repository.dart';
import 'package:picsel_github/modules/user/domain/entities/repository_entity.dart';

class GetStarredFromUser extends UseCase<List<RepositoryEntity>, Params> {
  final StarredRepository repository;

  GetStarredFromUser(this.repository);

  @override
  Future<Either<Failure, List<RepositoryEntity>>> call(Params params) async {
    return await repository.getStarredFromUser(params.username);
  }
}

class Params extends Equatable {
  final String username;

  Params({required this.username}) : super();

  @override
  List<Object> get props => [username];
}
