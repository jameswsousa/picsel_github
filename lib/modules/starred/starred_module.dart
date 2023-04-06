import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/starred/data/datasource/starred_datasource.dart';
import 'package:picsel_github/modules/starred/data/repositories/starred_repository_impl.dart';
import 'package:picsel_github/modules/starred/domain/repositories/starred_repository.dart';
import 'package:picsel_github/modules/starred/presentation/controller/starred_controller.dart';
import 'package:picsel_github/modules/starred/presentation/pages/starred_page.dart';

class StarredModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => StarredController(i())),
        Bind((i) => StarredDataSourceImpl(i())),
        Bind<StarredRepository>((i) =>
            StarredRepositoryImpl(networkInfo: i(), starredDataSource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => StarredPage(args.data)),
      ];
}
