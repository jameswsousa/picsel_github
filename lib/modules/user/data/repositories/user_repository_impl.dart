import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:picsel_github/core/network/network_info.dart';
import 'package:picsel_github/modules/user/data/datasource/user_datasource.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';
import 'package:picsel_github/modules/user/domain/entities/user_entity.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/modules/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.networkInfo, required this.userDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser(String username) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await userDataSource.getUser(username);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure(
            title: 'Erro no Servidor',
            message: 'Não foi possível obter os dados'));
      }
    } else
      return Left(ConnectionFailure(
          title: 'Erro na conexão',
          message:
              'Não foi possível buscar os dados.\nVerifique sua conexão e tente novamente'));
  }

  @override
  Future<Either<Failure, List<UserResultEntity>>> searchUser(
      String text) async {
    if (await networkInfo.isConnected) {
      try {
        final userResults = await userDataSource.searchUser(text);
        return Right(userResults);
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
