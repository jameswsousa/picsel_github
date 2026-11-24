import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/core_module.dart';
import 'package:picsel_github/modules/user/data/datasource/user_datasource.dart';
import 'package:picsel_github/modules/user/data/repositories/user_repository_impl.dart';
import 'package:picsel_github/modules/user/domain/repositories/user_repository.dart';
import 'package:picsel_github/modules/user/presentation/controller/user_controller.dart';
import 'package:picsel_github/modules/user/presentation/pages/user_page.dart';

class UserModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(UserController.new);
    i.addLazySingleton<UserDataSource>(UserDataSourceImpl.new);
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => UserPage(r.args.data));
  }
}
