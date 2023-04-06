import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/user/data/datasource/user_datasource.dart';
import 'package:picsel_github/modules/user/data/repositories/user_repository_impl.dart';
import 'package:picsel_github/modules/user/domain/repositories/user_repository.dart';
import 'package:picsel_github/modules/user/presentation/controller/user_controller.dart';
import 'package:picsel_github/modules/user/presentation/pages/user_page.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController(i())),
        Bind((i) => UserDataSourceImpl(i())),
        Bind<UserRepository>(
            (i) => UserRepositoryImpl(networkInfo: i(), userDataSource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => UserPage(args.data)),
      ];
}
