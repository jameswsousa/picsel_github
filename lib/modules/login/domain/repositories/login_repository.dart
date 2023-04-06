import 'package:dartz/dartz.dart';
import 'package:picsel_github/core/errors/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> login(String email, String password);
}
