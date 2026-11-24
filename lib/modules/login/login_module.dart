import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/core_module.dart';
import 'package:picsel_github/modules/login/data/datasource/login_datasource.dart';
import 'package:picsel_github/modules/login/data/repositories/login_repository_impl.dart';
import 'package:picsel_github/modules/login/domain/repositories/login_repository.dart';
import 'package:picsel_github/modules/login/presentation/controller/login_controller.dart';
import 'package:picsel_github/modules/login/presentation/pages/login_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(LoginController.new);
    i.addLazySingleton<LoginDataSource>(LoginDataSourceImpl.new);
    i.addLazySingleton<LoginRepository>(LoginRepositoryImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => LoginPage());
  }
}
