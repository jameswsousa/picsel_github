import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:picsel_github/modules/user/domain/entities/user_entity.dart';
import 'package:picsel_github/modules/user/domain/repositories/user_repository.dart';

class GetUser extends UseCase<UserEntity, Params> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.getUser(params.username);
  }
}

class Params extends Equatable {
  final String username;

  Params({required this.username}) : super();

  @override
  List<Object> get props => [username];
}
