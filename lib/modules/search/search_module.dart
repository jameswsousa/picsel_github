import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/core_module.dart';
import 'package:picsel_github/modules/search/data/datasource/search_datasource.dart';
import 'package:picsel_github/modules/search/data/repositories/search_repository_impl.dart';
import 'package:picsel_github/modules/search/domain/repositories/search_repository.dart';
import 'package:picsel_github/modules/search/presentation/controller/search_controller.dart';
import 'package:picsel_github/modules/search/presentation/pages/search_page.dart';

class SearchModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(SearchUsersController.new);
    i.addLazySingleton<SearchDataSource>(SearchDataSourceImpl.new);
    i.addLazySingleton<SearchRepository>(SearchRepositoryImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => SearchPage());
  }
}
