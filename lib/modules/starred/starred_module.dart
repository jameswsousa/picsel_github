import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/core_module.dart';
import 'package:picsel_github/modules/starred/data/datasource/starred_datasource.dart';
import 'package:picsel_github/modules/starred/data/repositories/starred_repository_impl.dart';
import 'package:picsel_github/modules/starred/domain/repositories/starred_repository.dart';
import 'package:picsel_github/modules/starred/presentation/controller/starred_controller.dart';
import 'package:picsel_github/modules/starred/presentation/pages/starred_page.dart';

class StarredModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(StarredController.new);
    i.addLazySingleton<StarredDataSource>(StarredDataSourceImpl.new);
    i.addLazySingleton<StarredRepository>(StarredRepositoryImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => StarredPage(r.args.data));
  }
}
