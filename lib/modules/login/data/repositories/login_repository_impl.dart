import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:picsel_github/core/network/network_info.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/modules/login/data/datasource/login_datasource.dart';
import 'package:picsel_github/modules/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(
      {required this.networkInfo, required this.loginDataSource});

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await loginDataSource.login(email, password);
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
