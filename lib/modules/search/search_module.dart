import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/search/data/datasource/search_datasource.dart';
import 'package:picsel_github/modules/search/data/repositories/search_repository_impl.dart';
import 'package:picsel_github/modules/search/domain/repositories/search_repository.dart';
import 'package:picsel_github/modules/search/presentation/controller/search_controller.dart';
import 'package:picsel_github/modules/search/presentation/pages/search_page.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchController(i())),
        Bind((i) => SearchDataSourceImpl(i())),
        Bind<SearchRepository>((i) =>
            SearchRepositoryImpl(networkInfo: i(), searchDataSource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => SearchPage()),
      ];
}
