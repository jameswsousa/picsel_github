import 'package:picsel_github/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/usecases/usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:picsel_github/modules/login/domain/repositories/login_repository.dart';

class Login extends UseCase<bool, Params> {
  final LoginRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.login(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({required this.email, required this.password}) : super();

  @override
  List<Object> get props => [email, password];
}
