import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:picsel_github/core/network/network_info.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/modules/search/data/datasource/search_datasource.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';
import 'package:picsel_github/modules/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final NetworkInfo networkInfo;
  final SearchDataSource searchDataSource;

  SearchRepositoryImpl(
      {required this.networkInfo, required this.searchDataSource});

  @override
  Future<Either<Failure, List<UserResultEntity>>> searchUsers(
      String text) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await searchDataSource.searchUsers(text);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure(
            title: 'Erro no Servidor',
            message: 'Não foi possível obter os dados'));
      }
    } else {
      return Left(ConnectionFailure(
          title: 'Erro na conexão',
          message:
              'Não foi possível buscar os dados.\nVerifique sua conexão e tente novamente'));
    }
  }
}
