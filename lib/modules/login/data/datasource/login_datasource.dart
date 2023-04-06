import 'package:picsel_github/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:picsel_github/core/utils/validation.dart';

abstract class LoginDataSource {
  Future<bool> login(String email, String password);
}

class LoginDataSourceImpl extends LoginDataSource {
  final http.Client client;

  LoginDataSourceImpl(this.client);

  @override
  Future<bool> login(String email, String password) => _login(email, password);

  Future<bool> _login(String email, String password) async {
    if (Validation.email(email) && password.length >= 8) {
      return true;
    } else {
      throw LoginException();
    }
  }
}
