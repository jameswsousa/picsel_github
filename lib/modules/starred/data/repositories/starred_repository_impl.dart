import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:picsel_github/core/network/network_info.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/modules/starred/data/datasource/starred_datasource.dart';
import 'package:picsel_github/modules/starred/domain/repositories/starred_repository.dart';
import 'package:picsel_github/modules/user/data/models/repository_model.dart';

class StarredRepositoryImpl extends StarredRepository {
  final NetworkInfo networkInfo;
  final StarredDataSource starredDataSource;

  StarredRepositoryImpl(
      {required this.networkInfo, required this.starredDataSource});

  @override
  Future<Either<Failure, List<RepositoryModel>>> getStarredFromUser(
      String username) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await starredDataSource.getStarredFromUser(username);
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
