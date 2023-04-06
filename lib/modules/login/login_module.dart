import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/login/data/datasource/login_datasource.dart';
import 'package:picsel_github/modules/login/data/repositories/login_repository_impl.dart';
import 'package:picsel_github/modules/login/domain/repositories/login_repository.dart';
import 'package:picsel_github/modules/login/presentation/controller/login_controller.dart';
import 'package:picsel_github/modules/login/presentation/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i())),
        Bind((i) => LoginDataSourceImpl(i())),
        Bind<LoginRepository>(
            (i) => LoginRepositoryImpl(networkInfo: i(), loginDataSource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => LoginPage()),
      ];
}
