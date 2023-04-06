import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';
import 'package:picsel_github/modules/search/domain/repositories/search_repository.dart';

class SearchUsers extends UseCase<List<UserResultEntity>, Params> {
  final SearchRepository repository;

  SearchUsers(this.repository);

  @override
  Future<Either<Failure, List<UserResultEntity>>> call(Params params) async {
    return await repository.searchUsers(params.text);
  }
}

class Params extends Equatable {
  final String text;

  Params({required this.text}) : super();

  @override
  List<Object> get props => [text];
}
